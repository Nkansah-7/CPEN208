-- Create the Database
CREATE DATABASE CPEN L200 ;



-- Create Schemas (if needed)
CREATE SCHEMA student;
CREATE SCHEMA course;
CREATE SCHEMA fees;
CREATE SCHEMA lecture;

-- Create Tables

-- Student Personal Information
CREATE TABLE student.students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    student_number VARCHAR(10) NOT NULL UNIQUE
);

-- Student Fees Payments
CREATE TABLE fees.payments (
    payment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES student.students(student_id),
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL
);

-- Courses
CREATE TABLE course.courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(10) NOT NULL UNIQUE
);

-- Course Enrollment
CREATE TABLE course.enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL REFERENCES student.students(student_id),
    course_id INT NOT NULL REFERENCES course.courses(course_id),
    enrollment_date DATE NOT NULL
);

-- Lectures
CREATE TABLE lecture.lectures (
    lecture_id SERIAL PRIMARY KEY,
    lecture_name VARCHAR(100) NOT NULL,
    lecture_code VARCHAR(10) NOT NULL UNIQUE
);

-- Lectures to Course Assignment
CREATE TABLE lecture.lecture_courses (
    id SERIAL PRIMARY KEY,
    lecture_id INT NOT NULL REFERENCES lecture.lectures(lecture_id),
    course_id INT NOT NULL REFERENCES course.courses(course_id)
);

-- Lectures to TA Assignment
CREATE TABLE lecture.lecture_tas (
    id SERIAL PRIMARY KEY,
    lecture_id INT NOT NULL REFERENCES lecture.lectures(lecture_id),
    ta_name VARCHAR(100) NOT NULL
);

-- Insert Scripts to Populate Tables with Sample Data

-- Insert students
INSERT INTO student.students (first_name, last_name, student_number)
VALUES
    ('Derrick', 'Ampongsah Amomah', '11347946'),
    ('Ishaan', 'Bhardwaj', '11004272'),
    ('David', 'Ntow Anno', '11025159'),
    ('Amevenku Kwaku', 'Mawuli', '11296662'),
    ('Apetsi Freda', 'Elikplim', '11348310'),
    ('Annan Chioma', 'Priaise', '11014727'),
    ('Abubakar', 'Latifah', '11209640'),
    ('Hayet Adwoa', 'dabanka', '11353826'),
    ('Abena Nhyira', 'Nsaako', '11254405'),
    ('Sena Delase', 'Anyomi', '11292620'),
    ('Samia', 'Soleimani', '11010910'),
    ('David Tetteh', 'Ankrah', '11285635'),
    ('Daniel Agyin', 'Manford', '11015506'),
    ('Wenide', 'Isaac', '11172376'),
    ('Asare', 'Marvin', '11049492'),
    ('Kudiabor', 'Jonathan', '11254301'),
    ('Mohammed Salihu', 'Hamisu', '11014977'),
    ('Desmond', 'Kamasah', '11253931'),
    ('Nkansah Boadu', 'Tabi', '11170350'),
    ('Nyako Steven', 'Abokuah', '11117318'),
    ('Fordjour John', 'Edward', '11254079'),
    ('Adorboe Prince', 'Kwasi', '11218951'),
    ('Munagah Muhamed Nurul', 'Haqq', '11117536'),
    ('Berardine', 'Adusei-Okrah', '11123762'),
    ('Maame Afua Ayisibea', 'Ayisi', '11139245'),
    ('Ayertey Venessa', 'Esinam', '11264010'),
    ('Ebenezer', 'Arthur', '11012330'),
    ('Fiavor Isaac', 'Sedem', '11112276'),
    ('Kumi Kelvin', 'Gyabaah', '11012343'),
    ('Ninson', 'Obed', '11238291'),
    ('Nana Kwasi', 'Kwakye', '11358243'),
    ('Mathew Kotey', 'Mensah', '11332163'),
    ('John Tenkorang', 'Anim', '11208328'),
    ('Ampongsah Jonathan', 'Boadu', '11293871'),
    ('Quansah', 'Jeffery', '11252855'),
    ('Nuku-Tagbor', 'Joshua', '11252857'),
    ('Kafu', 'Kemeh', '11116804'),
    ('Pius', 'Oblie', '11018690'),
    ('Antwi Samuel Kojo', 'Anafi', '11164744'),
    ('Attu samuel', 'Idana', '11213307'),
    ('Agyemang Opoku', 'Edward', '11356824'),
    ('Dedoo Donatus', 'Dodzi', '11262592'),
    ('Eririe', 'Jeffrey', '11116737'),
    ('Y. T. Mohammed', '-Awal', '11116537'),
    ('Agyepong Kwesi', 'Asante', '11038081'),
    ('Kwarteng Andrews', 'Twum', '11105235'),
    ('Mohammed Awal Yakubu', 'Junior', '11334401'),
    ('Iddrisu', 'Tahiru', '11021544'),
    ('Isaac Nii Nortey', 'Barnor', '11297849'),
    ('Nyayun', 'Prince', '11275876'),
    ('Ahmed Fareed', 'Opare', '11338323'),
    ('Peggy Esinam', 'Somuah', '11049523'),
    ('Yasmeen Xoladem', 'Doku', '11330446'),
    ('Nyavor Cyril', 'Etornam', '11023595'),
    ('Anewah', 'Vincent', '11246366'),
    ('Amoafo', 'Osei', '11253407'),
    ('Asare Baffour King', 'David', '11296641'),
    ('Samuel', 'Ampomah', '11053386'),
    ('Nana K.', 'Fosu Asamoah', '11305528');

-- Insert courses
INSERT INTO course.courses (course_name, course_code)
VALUES
    ('Linear Circuits', 'CPEN206'),
    ('software Engineering', 'CPEN208'),
    ('Differential Equation', 'SENG 202'),
    ('Data Structures and Algorithm', 'CPEN204'),
    ('Digital System Design', 'CPEN202'),
    ('Data Communication','CPEN212'),
    ('Academic Writing II','CBAS210');

-- Insert lectures
INSERT INTO lecture.lectures (lecturer_id,lecturer_name,lecture_ta lecture_course)
VALUES
     (2100,'Dr.Godfrey Augustus Mills', 'Hakeem Nasser',1),
     (2200,'Mr. John Asiammah', 'Foster Anopasuo',2),
     (2300,'Mr. John Kutor', 'Benjamin Yeboah',3),
     (2400,'Dr.Margaret Ansah Richardson','Foster Anopasuo',4),
     (2500,'Mr. Agyare Debrah','Moses Annan',5),
     (2600,'Dr. Isaac Aboagye', 'Samed Haruna',6),
     (2700, 'Mr. Prosper Afriyie','Moses Annan',7);
    



CREATE OR REPLACE FUNCTION calculate_outstanding_fees()
RETURNS JSON AS $$
DECLARE
    student RECORD;
    outstanding_fees JSON := '[]'::JSON;
    total_paid int ;
    total_due int := 2000.00; -- Assuming a total fee of 2000 for all students
BEGIN
    FOR student IN SELECT student_id, first_name, last_name FROM student.students LOOP
        SELECT COALESCE(SUM(amount), 0) INTO total_paid FROM fees.payments WHERE student_id = student.student_id;
        outstanding_fees := outstanding_fees || JSON_BUILD_OBJECT(
            'student_id', student.student_id,
            'student_name', student.first_name || ' ' || student.last_name,
            'outstanding_fees', total_due - total_paid
        );
    END LOOP;
    RETURN outstanding_fees;
END;
$$ LANGUAGE plpgsql;



