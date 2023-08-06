
// 프로시저 호출문
call RANKPRODUCTDTL('1040');

// 프로시저 생성문
CREATE PROCEDURE RANKPRODUCTDTL (MAXPNUM CHAR(50))
BEGIN
        DECLARE TMPPRODUCTIDX varchar(20);
        DECLARE MINAMT INT DEFAULT 0;
        DECLARE MINSHOP INT DEFAULT 0;


        /* 최저 금액 확인 */
        SELECT 
                PRODUCTIDX 
                , MIN(DTLPAYAMTRNK)
        INTO TMPPRODUCTIDX, MINAMT
        FROM (
                SELECT
                        productidx,
                        idx,
                        shopidx,
                        case when CAST(dtlpayamt as unsigned) = 0
                                        then 99999999999999
                        else dtlpayamt
                        end dtlpayamtrnk
                FROM product_dtl_lst pdl 
                where PRODUCTIDX = MAXPNUM
                group by
                        productidx,
                        idx,
                        shopidx
        ) a
        GROUP BY PRODUCTIDX;

        /* SHOPIDX 확인 */
        SELECT 
                PRODUCTIDX
                , DTLPAYAMT
                , MIN(SHOPIDX)
        INTO TMPPRODUCTIDX, MINAMT, MINSHOP
        FROM product_dtl_lst pdl 
        WHERE PRODUCTIDX        = MAXPNUM
          AND DTLPAYAMT         = MINAMT
        GROUP BY PRODUCTIDX, DTLPAYAMT;

        /* RANK 초기화 */
    UPDATE product_dtl_lst
    SET RANK = 0
    WHERE PRODUCTIDX = MAXPNUM;
   
        /* 최소 금액 RANK 초기화 */
    UPDATE product_dtl_lst
    SET RANK = 1
    WHERE PRODUCTIDX    = MAXPNUM
      AND SHOPIDX               = MINSHOP
          AND DTLPAYAMT         = MINAMT;
       
END