--지역테이블 생성 
CREATE TABLE REGION(
	REGION_NO NUMBER(3) PRIMARY KEY,
	REGION_NAME VARCHAR2(30) NOT NULL
);

--지역테이블 예시
INSERT INTO REGION VALUES(001, '영광');
INSERT INTO REGION VALUES(002, '목포');
INSERT INTO REGION VALUES(003, '무안');
INSERT INTO REGION VALUES(004, '보성');
INSERT INTO REGION VALUES(005, '영광');
INSERT INTO REGION VALUES(006, '신안');
INSERT INTO REGION VALUES(007, '여수');
INSERT INTO REGION VALUES(008, '완도');
INSERT INTO REGION VALUES(009, '해남');


--카테고리 번호 테이블 생성 
CREATE TABLE ITEM_CATEGORY(
 	CATEGORY_NO NUMBER(2) PRIMARY KEY,
	CATEGORY_NAME VARCHAR2(30) NOT NULL
);

--카테고리 번호 예시 
INSERT INTO ITEM_CATEGORY VALUES(1,'생선');
INSERT INTO ITEM_CATEGORY VALUES(2, '건어물');
INSERT INTO ITEM_CATEGORY VALUES(3, '김/해초');
INSERT INTO ITEM_CATEGORY VALUES(4, '해산물/어패류');
INSERT INTO ITEM_CATEGORY VALUES(5, '젓갈');
INSERT INTO ITEM_CATEGORY VALUES(6, '수산물 기타');


--상품 테이블 생성
CREATE TABLE ITEM(
	ITEM_NO NUMBER(8) PRIMARY KEY,
	CATEGORY_NO NUMBER(2) REFERENCES ITEM_CATEGORY(CATEGORY_NO) NOT NULL,
    SELLER_NO NUMBER(6) REFERENCES SELLER(SELLER_NO),
	REGION_NO NUMBER(3) REFERENCES REGION(REGION_NO),
    ITEM_NAME VARCHAR2(60) NOT NULL, 
	ITEM_PRICE NUMBER(10),
	ITEM_STOCK NUMBER(3) NOT NULL, 
	ITEM_ADD_DATE DATE DEFAULT SYSDATE,
	ITEM_APPROVE VARCHAR2(5) CHECK(ITEM_APPROVE IN ('FALSE', 'TRUE')),
	ITEM_GRADE decimal(2,1)
);


SELECT * FROM ITEM;



CREATE SEQUENCE SEQ_ITEM_TABLE; --- 상품 테이블의 번호
CREATE SEQUENCE SEQ_ITEM_NO; -- -상품 하나하나의 번호 



--지역번호(고흥, 목포, 무안, 보성, 영광, 신안, 여수, 완도, 해남)->061



--상품(상품번호, 카테고리번호, 판매자번호, 지역번호, 상품이름, 상품가격, 상품재고량, 상품등록일, 상품승인여부, 상품평점)

INSERT INTO ITEM VALUES(SEQ_ITEM_NO.NEXTVAL, 1, 1, 001, '영광법성포 옥굴비 황토염장대5호 20미', 54500, 200, DEFAULT, 'TRUE', 5);
INSERT INTO ITEM VALUES(SEQ_ITEM_NO.NEXTVAL, 2, 2, 001, '영광굴비 20미 장대 선물세트', 21900, 100, DEFAULT, 'FALSE', 4.5);

