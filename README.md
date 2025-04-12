# Hospital_System_Frontend
 
#Read Me 

Front end
The front end was written using Flutter,
Folder Name: hospital_app_frontend

Dart installation is required and flutter as well as vsCode  

There are 4 different views
1-Patient 
2-Doctor
3-Accountant 
4-Admin

Patient 
The patientView folder is divided into folders 

Screens which contain all the user interfaces for the patient 
Services which contain all the functions that make the application operable 

The screens folder is divided into Auth for all the interfaces related to logging in and signing up. Financial for the payments of the patient. Profile for the user profile and show case the information of the user. Home which is the main screen of the patient that show case the diagnosis and Report to show case all the reports generated for the patient.

The services is divided into Auth for the authentication functionalities, diagnosisServices for getting the diagnosis for the patient, finentialSevices to fetch all the payment records of the patient and others is for other services including the main color of the app data provider which is the state management used in the app.

Doctor
Screens which contain all the user interfaces for the Doctor 
Services which contain all the functions that make the application operable 

Screen has Diagnosis which contain the UI of uploading the diagnosis and showcasing it to the doctor as well as generating the report. Home is the home page for the doctors where they select the function they want to do. Patient to get the patient information. Report used to search and show the reports generated.

Services include DiagnosisServices which is responsible for uploading image to google cloud server and create the diagnosis as well as fetching it. ReportServices used to generate and upload the report to the google cloud server. userServices are used get patient data to show it to doctors.

Admin View

 Screens which contain all the user interfaces for the Admin 
Services which contain all the functions that make the application operable 

Screen contains Home which is the main interface to the admin 
Services contains deleting a user and updating the account type.

Accountant view

Screens which contain all the user interfaces for the accountant
Services which contain all the functions that make the application operable 

Screens contains Home which is the main interface for the accountant and payments which show case the transaction history where he can mark a payment as paid.

Services has three functions getting the payments, getting the user and changing the state of the transaction.
