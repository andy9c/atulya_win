var admin = require("firebase-admin");
const Excel = require('exceljs')

var serviceAccount = require("./atulya-adivasi-firebase-adminsdk.json");

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();
let workbook = new Excel.Workbook()
let worksheet = workbook.addWorksheet('atulya')

const rowValues = [];
rowValues[1] = 4;
rowValues[5] = 'Kyle';
rowValues[9] = new Date();

const table = worksheet.getTable('MyTable');

// remove second column
// table.removeColumns(1, 1);

// insert new column (with data) at index 1
table.addColumn(
  {name: 'Letter', totalsRowFunction: 'custom', totalsRowFormula: 'ROW()', totalsRowResult: 6, filterButton: true},
  ['a', 'b', 'c', 'd'],
  2
);

// commit the table changes into the sheet
table.commit();

async function getData() {
    // const snapshot = await db.collection('atulya_adivasi_2022').get();
    // snapshot.forEach((doc,index) => {
    //   let e = doc.data()
    //   let id = doc.id
    //   let isDeleted = doc.isDeleted ?? false
    //   let isEdited = doc.isEdited ?? false

    //   rowValues[1] = id
    //   rowValues[2] = email
    //   rowValues[3] =

    //   worksheet.addRow(rowValues);
    // });
    workbook.xlsx.writeFile('atulya.xlsx')

}

getData()