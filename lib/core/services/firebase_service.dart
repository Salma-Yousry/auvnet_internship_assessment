import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService{
  FirebaseAuth _auth;
  FirebaseFirestore store;
  FirebaseService(this._auth,this.store);

  Future login({required String email, required String password}) async{
    UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    //return credential;
    User? user = credential.user;
    return user;
  }
  Future register(String UserName,String email, String password, String phone) async{
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //return credential;
        User? user = credential.user;
        print(UserName);
        if(user!=null){
          await user.updateDisplayName(UserName);
          await user.reload();
          user=await _auth.currentUser;
          var userId=user!.uid;
          try {
            await store.collection('users').doc(userId).set({
              'email': email,
              'username': UserName,
              'phone': phone,
              'photoUrl': " ",
              'createdAt': FieldValue.serverTimestamp(),
            });
            print("Done");
            DocumentSnapshot userDoc = await store.collection('users').doc(userId).get();
            var data=userDoc.data() as Map<String, dynamic>;
            print("${data}");
          } catch (e) {
            print("-------------------------");
            print("Error saving user data: $e");
            print("-------------------------");
          }
        }
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      return user;
      }

    }on FirebaseAuthException catch (e){
      //FirebaseAuthFailure(e.code.toString(),errMessage: e.code.toString(), statusCode: '400');
      if (e.code == 'invalid-email') {
        throw Exception('Invalid email');
      }
      if (e.code == 'email-already-in-use') {
        throw Exception('Hi, User not found');
      } else if (e.code == 'weak-password') {
        throw Exception ( "Your password is weak");
      }
      else{
        throw Exception("email and password are not correct");
      }
    }
  }
  Future Reload() async{
    try {
      User? user=await _auth.currentUser;
      await user!.reload();
      user=await _auth.currentUser;
return user;
    }catch(e){
      throw "Check your internet";
    }
  }


}