// Import the functions you need from the SDKs you need
import { initializeApp } from "@firebase/app";
import { getAnalytics } from "@firebase/analytics";
import { getFirestore } from "@firebase/firestore";
import { getStorage } from "@firebase/storage";
import { getPerformance } from "@firebase/performance";


// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyDMmHSXPkeHQGnM1-Ixubbm9YjaIeq6KCc",
  authDomain: "atulya-adivasi.firebaseapp.com",
  projectId: "atulya-adivasi",
  storageBucket: "atulya-adivasi.appspot.com",
  messagingSenderId: "850170061240",
  appId: "1:850170061240:web:9deff4d20c2f54c88a6f4d",
  measurementId: "G-2VNLKDJ8E3"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const defaultAnalytics = getAnalytics(app);
const defaultFirestore = getFirestore(app);
const defaultStorage = getStorage(app);
const defaultPerformance = getPerformance(app);