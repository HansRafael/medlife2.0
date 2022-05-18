-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-05-18 18:03:04.485

-- tables
-- Table: question
CREATE TABLE question (
    id int  NOT NULL,
    text varchar(1000)  NOT NULL,
    question_type_id int  NOT NULL,
    CONSTRAINT question_pk PRIMARY KEY (id)
);

-- Table: question_order
CREATE TABLE question_order (
    id int  NOT NULL,
    question_id int  NOT NULL,
    survey_id int  NOT NULL,
    "order" int  NOT NULL,
    CONSTRAINT question_order_ak_1 UNIQUE (survey_id, question_id) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT question_order_pk PRIMARY KEY (id)
);

-- Table: question_type
CREATE TABLE question_type (
    id int  NOT NULL,
    name varchar(30)  NOT NULL,
    CONSTRAINT question_type_pk PRIMARY KEY (id)
);

-- Table: respondent
CREATE TABLE respondent (
    id int  NOT NULL,
    first_name varchar(100)  NULL,
    last_name varchar(100)  NULL,
    email varchar(254)  NULL,
    created timestamp  NOT NULL,
    ip_address varchar(45)  NOT NULL,
    CONSTRAINT respondent_pk PRIMARY KEY (id)
);

-- Table: response
CREATE TABLE response (
    survey_response_id int  NOT NULL,
    question_id int  NOT NULL,
    respondent_id int  NOT NULL,
    answer varchar(1000)  NOT NULL,
    CONSTRAINT response_pk PRIMARY KEY (survey_response_id,question_id,respondent_id)
);

-- Table: response_choice
CREATE TABLE response_choice (
    id int  NOT NULL,
    question_id int  NOT NULL,
    text varchar(1000)  NOT NULL,
    CONSTRAINT response_choice_pk PRIMARY KEY (id)
);

-- Table: survey
CREATE TABLE survey (
    id int  NOT NULL,
    title varchar(100)  NOT NULL,
    description varchar(1000)  NULL,
    message_final varchar(256)  NULL,
    created_at timestamp  NOT NULL,
    updated timestamp  NOT NULL,
    opening_time timestamp  NOT NULL,
    closing_time timestamp  NOT NULL,
    user_id int  NOT NULL,
    link_youtube varchar(256)  NOT NULL,
    CONSTRAINT survey_pk PRIMARY KEY (id)
);

-- Table: survey_response
CREATE TABLE survey_response (
    id int  NOT NULL,
    survey_id int  NOT NULL,
    respondent_id int  NOT NULL,
    updated timestamp  NOT NULL,
    started_at timestamp  NOT NULL,
    completed_at timestamp  NOT NULL,
    CONSTRAINT survey_response_pk PRIMARY KEY (id)
);

-- Table: user
CREATE TABLE "user" (
    id int  NOT NULL,
    email varchar(254)  NOT NULL,
    hashed_password varchar(100)  NOT NULL,
    first_name varchar(100)  NOT NULL,
    last_name varchar(100)  NOT NULL,
    created timestamp  NOT NULL,
    active boolean  NOT NULL,
    CONSTRAINT emaill UNIQUE (email) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT user_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: question_order_question (table: question_order)
ALTER TABLE question_order ADD CONSTRAINT question_order_question
    FOREIGN KEY (question_id)
    REFERENCES question (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: question_order_survey (table: question_order)
ALTER TABLE question_order ADD CONSTRAINT question_order_survey
    FOREIGN KEY (survey_id)
    REFERENCES survey (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: question_question_type (table: question)
ALTER TABLE question ADD CONSTRAINT question_question_type
    FOREIGN KEY (question_type_id)
    REFERENCES question_type (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: response_choice_question (table: response_choice)
ALTER TABLE response_choice ADD CONSTRAINT response_choice_question
    FOREIGN KEY (question_id)
    REFERENCES question (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: response_question (table: response)
ALTER TABLE response ADD CONSTRAINT response_question
    FOREIGN KEY (question_id)
    REFERENCES question (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: response_respondent (table: response)
ALTER TABLE response ADD CONSTRAINT response_respondent
    FOREIGN KEY (respondent_id)
    REFERENCES respondent (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: response_survey_response (table: response)
ALTER TABLE response ADD CONSTRAINT response_survey_response
    FOREIGN KEY (survey_response_id)
    REFERENCES survey_response (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: survey_response_respondent (table: survey_response)
ALTER TABLE survey_response ADD CONSTRAINT survey_response_respondent
    FOREIGN KEY (respondent_id)
    REFERENCES respondent (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: survey_response_survey (table: survey_response)
ALTER TABLE survey_response ADD CONSTRAINT survey_response_survey
    FOREIGN KEY (survey_id)
    REFERENCES survey (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: survey_user (table: survey)
ALTER TABLE survey ADD CONSTRAINT survey_user
    FOREIGN KEY (user_id)
    REFERENCES "user" (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

