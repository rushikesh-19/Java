create database healthcare;
use healthcare;

-------------------------------------------------------------------------------- Create Table Admin -----------------------------------------------------------------------------------------------------

create table admin (adminId int primary key auto_increment, adminName varchar(30), adminUsername varchar(30), adminPassword varchar(30));

insert into admin (adminName, adminUsername, adminPassword) values ('admin', 'admin', 'admin'); 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------- Create Table Patient -----------------------------------------------------------------------------------------------------
create table patient(patientId int primary key auto_increment,patientGender varchar(10),patientName varchar(30),patientBirthdate date,
patientHeight int,patientWeight int,patientUsername varchar(30),patientPassword varchar(30),patientAllergy varchar(500),
patientSymptoms varchar(500),patientIlleness varchar(500),patientOperations varchar(500),patientMedictions varchar(500),patientExercise varchar(30),
patientDiet varchar(30),patientDrink varchar(30),patientCaffeine varchar(30),patientSmoke varchar(30),patientComments varchar(500),
doctorSuggestions varchar(500),suggested boolean,contactPerson varchar(500));

insert into patient (patientGender, patientName, patientBirthdate, patientHeight, patientWeight, patientUsername, patientPassword, patientAllergy,
patientSymptoms, patientIlleness, patientOperations, patientMedictions, patientExercise, patientDiet, patientDrink, patientCaffeine, patientSmoke, 
patientComments, doctorSuggestions,suggested, contactPerson) 
values
('Male', 'Eddard Stark', '1999-06-19', '172', '55', 'eddard@gmail.com', '9503632001', 
'I have xyz allergy. masg skh kjg jjetjreojo jerjkk kjkwrkcjk kjkrwhkckkew kjk3qrhk k3rqkkj kjrqkjvjkbj   jerj vjr3j jvoawj jbjejj kjbq3rjfdj jqwrj  h lkhb.',
'Anemia, Asthama, Gout', 'no other illeness dkhje lkhkhg jhdgjkh kjhrgkuhk jdhfkjhfse.',
 '19-06-199 kjijwdi hhgu ijoirjoijk ok;ot 20/525/5656 kjhkesfh ijioejrio oioiewhroih oihoiioerjoi hoihowrhoiu houheoi iojiowhroiwh oiho qhrioh iohioei',
'abc 20mg tab jhjsh 50mg tabsggde 100ml syrup', 'Never', 'I have a loose diet', 'I dont drink', '1-2 cups/day', 'no', 
'lkdfhkjhk kjhskfjhk kjhskfhkuh uhseruhk hksefkhskh kjhefkuku uhwruh uhwerhiu huhuerhiu.', 'No Suggestions',false,'Contact Soon');

insert into patient (patientGender, patientName, patientBirthdate, patientHeight, patientWeight, patientUsername, patientPassword, patientAllergy,
patientSymptoms, patientIlleness, patientOperations, patientMedictions, patientExercise, patientDiet, patientDrink, patientCaffeine, patientSmoke, 
patientComments, doctorSuggestions,suggested, contactPerson) 
values
('Male', 'John Snow', '1988-05-20', '176', '72', 'johnsnow@gmail.com', '9503632001', 
'Hi ijixjsij ijifjijji ijijdw jihuhgygu ggvgvsgu gyhjqwjm kljowjdiu iiwebi iuiuqweiuh weih uhiuwed iuhiuw hqwehu jihiadhih ihhiu hiuhwdiuh iuhqwiudh 
uihwidujasiji ihiduh hdwiuh uhiuh iuhwiuhiuhqwiuhe jhwdwi 12/89/8000', 
'Anemia, Asthma, Arthritis, Cancer, Gout, Diabetes, Emotional Disorder, Epilepsy Seizures, Liver Disease', 'no other illnesses', 
'no sk ijisajj jidsnn cnvdsni ninen nnkasndkn kndsa nkkasdkk kcsj klnask cmoin nncsoi knfewkn piknen ifen knsoin knascojn xkk 19/06/1999', 
'uhd uhfh yg8wef hyhgef8y yf huwehfuh i havr asdhiu ihdiwi huihefwih iuhfewih iuhiuiu huihuhuhuh us uhsduh huh ihh uihfeiuh  95/06/1999',
'Never', 'I have a loose diet', 'I dont drink', 'I dont use caffeine', 'No', 'jfhiwuh iuej juijewirj jwjeojpoj oijroifjj jioreji iojeioj jiojeijioj jeoijoiej ioeiofioej ',
'No Suggestions', false, 'Contact Soon');

insert into patient (patientGender, patientName, patientBirthdate, patientHeight, patientWeight, patientUsername, patientPassword, patientAllergy,
patientSymptoms, patientIlleness, patientOperations, patientMedictions, patientExercise, patientDiet, patientDrink, patientCaffeine, patientSmoke, 
patientComments, doctorSuggestions,suggested, contactPerson) 
values
('Female', 'Arya Stark', '1998-06-19', '150', '40', 'aryastark@gmail.com', '9503632001', 
'no allergies', 'Asthma, Arthritis, Cancer, Gout, Diabetes, Emotional Disorder, Epilepsy Seizures, Fainting Spells, Gallstones, Heart Disease, Heart Attack', 
'no other illnesses', 'no operations', 'nicip plus 30mg tab dr.Dx 100ml syrup omee 20mg cap','Never', 'I have a loose diet', 'I dont drink', 
'I dont use caffeine', 'No', 'no comments', 'No Suggestions', false, 'Contact Soon');
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------- Create Table Payment --------------------------------------------------------------------------------------------------
create table payment (paymentId int primary key auto_increment, paymentStatus boolean, paymentReceipt varchar(50), 
patientId int references patientId(patient), paymentDate timestamp default current_timestamp);
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------- Create Table Report --------------------------------------------------------------------------------------------------
create table report (reportId int primary key auto_increment, reportStatus boolean, reportReceipt varchar(50),
patientId int references patientId(patient), reportDate timestamp default current_timestamp);

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------- Create Table Contact -----------------------------------------------------------------------------------------------------
create table contact (contactId int primary key auto_increment, name varchar(50), email varchar(45), phone varchar(15), query varchar(500), enquiryStatus boolean,
modifiedDate timestamp default current_timestamp);
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------- Create Table Doctor -----------------------------------------------------------------------------------------------------
create table doctor(doctorId int primary key auto_increment,doctorName varchar(30),doctorUsername varchar(30),doctorPassword varchar(30), 
dateOfJoining date,doctorPost varchar(30),doctorExperience varchar(30),doctorDesignation varchar(30));

insert into doctor (doctorName, doctorUsername, doctorPassword, dateOfJoining, doctorPost, doctorExperience, doctorDesignation) 
values ('Rajiv  Jha','rajiv@gmail.com','rajiv','2016/01/12','Senior','3 years','gynaecologist');

insert into doctor (doctorName, doctorUsername, doctorPassword, dateOfJoining, doctorPost, doctorExperience, doctorDesignation) 
values ('Tanvi Basu','tanvibasu45@gmail.com','tanvi45','2017/08/11','Head','8 years','MBBS');

insert into doctor (doctorName, doctorUsername, doctorPassword, dateOfJoining, doctorPost, doctorExperience, doctorDesignation) 
values ('Prerna Gholap','pgholap@yahoo.com','prerna17','2014/01/07','Junior','2 years','Physiotheripist');

insert into doctor (doctorName, doctorUsername, doctorPassword, dateOfJoining, doctorPost, doctorExperience, doctorDesignation) 
values ('Pranav Bhosale','pranavb@gmail.com','pbhosale19','2016/01/19','Senior','3 years','gynaecologist');

insert into doctor (doctorName, doctorUsername, doctorPassword, dateOfJoining, doctorPost, doctorExperience, doctorDesignation) 
values ('Sonam Chajad','sonamchajad11@gmail.com','sonam119','2019/09/11','Head','9 years','Physiotherapist');
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------- Queries ------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------- Admin --------------------------------------------------------------------------------------------------------------------
String adminLogin = "select * from admin where adminUsername=? and adminPassword=?";
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------- Patient -------------------------------------------------------------------------------------------------------------------
String patientRegister = "insert into patient (patientGender,patientName,patientBirthdate,patientHeight,patientWeight,patientUsername,
patientPassword,patientAllergy,patientSymptoms,patientIlleness,patientOperations,patientMedictions,patientExercise,patientDiet,patientDrink,
patientCaffeine,patientSmoke,patientComments,doctorSuggestions,suggested,contactPerson) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

String patientLogin = "select * from patient where patientUsername=? and patientPassword=?";

String showAllPatient = "select * from patient";

String patientDetails = "select * from patient where patientId = " + patientId;

String deletePatient = "delete from patient where patientId=" + patient.getPatientId();

String updateSuggestionContact = "update patient set doctorSuggestions=?, suggested=?, contactPerson=? where patientId = " + patientId;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------- Doctor -------------------------------------------------------------------------------------------------------------------
String addNewDoctor = "insert into doctor(doctorName, doctorUsername, doctorPassword, dateOfJoining, doctorPost, doctorExperience,
doctorDesignation) values(?,?,?,?,?,?,?)";

String showAllDoctors = "select * from doctor";

String doctorDetails = "select * from doctor where doctorId = " + doctorId;

String doctorLogin = "select * from doctor where doctorUsername=? and doctorPassword=?";

String deleteDoctor = "delete from doctor where doctorId = " + doctor.getDoctorId();
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------- Payment -------------------------------------------------------------------------------------------------------------------
String setNewPayment = "insert into payment (paymentStatus, paymentReceipt, patientId) values (?,?,?)";

String updatePaymentReceipt = "update payment set paymentReceipt = ? where paymentId = " + paymentId;

String paymentPaid = "update payment set paymentStatus = true where paymentId = " + payment.getPaymentId();

String paymentUnpaid = "update payment set paymentStatus = false where paymentId=" + payment.getPaymentId();

String deletePayment = "delete from payment where paymentId = " + payment.getPaymentId();

String patientPayments = "select payment.paymentId, payment.paymentStatus, payment.paymentReceipt, payment.paymentDate, patient.patientId, 
patient.patientName from payment join patient where payment.patientId = " + patientId + " and patient.patientId = " + patientId;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------- Report -------------------------------------------------------------------------------------------------------------------
String setNewReport = "insert into report (reportStatus, reportReceipt, patientId) values (?,?,?)";

String updateReportReceipt = "update report set reportReceipt = ? where reportId= " + reportId;

String hideReport = "update report set reportStatus = false where reportId = " + report.getReportId();

String showReport = "update report set reportStatus = true where reportId = " + report.getReportId();

String deleteReport = "delete from report where reportId = " + report.getReportId();

String patientReports = "select report.reportId, report.reportStatus, report.reportReceipt, report.reportDate, patient.patientId, 
patient.patientName from report join patient where report.patientId = " + patientId + " and patient.patientId = " + patientId;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
