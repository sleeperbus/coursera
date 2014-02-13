with data as (
select
        a.rcv_dept
--      , b.dept_abbr
        , a.asst_no
--      , c.asst_nm
--      , c.asst_format
--      , c.detail_cont
        , decode(a.asst_move_tp, '2', a.tran_dt, c.get_dt)
            as tran_dt
        , c.get_dt
        , c.get_amt
--      , sy.nfei_asset_remn_amt(a.asst_no, sy.nfxz_dt) remn_amt
--      , sy.nfei_asst_div_name(a.asst_no) div_name
        , a.seq
        , rownum rn
from    sy.neie02m10 a
        , sy.neaa09m00 b
        , sy.neie02m00 c
where   a.rcv_dept = '051'
and     a.tran_dt <= sy.nfxz_dt
and     b.dept_code = a.rcv_dept
and     c.asst_no = a.asst_no
)
select  a.*
from    (
        select
                a.*
                , (
                    select
                            /*+ index_desc(x neie02m10_u10) */
                            seq
                    from    sy.neie02m10 x
                    where   x.asst_no = a.asst_no
                    and     x.tran_dt <= sy.nfxz_dt
                    and     rownum = 1
                ) as max_seq
                , (
                    select  /*+ index_desc(y neie03m00_u10) */
                            y.asst_remn_amt
                    from    sy.neie03m00 y
                    where   y.asst_no = a.asst_no
                    and     y.depr_dt <= sy.nfxz_dt
                    and     rownum = 1
                ) as asst_remn_amt
        from    data a
        ) a
where   a.seq = max_seq


---------------------------------------------------------------------------------------------------
| Id  | Operation                         | Name          | Rows  | Bytes | Cost (%CPU)| Time     |
---------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                  |               |    56 |  5208 |     3   (0)| 00:00:01 |
|*  1 |  COUNT STOPKEY                    |               |       |       |            |          |
|*  2 |   TABLE ACCESS BY INDEX ROWID     | NEIE02M10     |     2 |    58 |     1   (0)| 00:00:01 |
|*  3 |    INDEX RANGE SCAN DESCENDING    | NEIE02M10_U10 |   449 |       |     1   (0)| 00:00:01 |
|*  4 |  COUNT STOPKEY                    |               |       |       |            |          |
|*  5 |   TABLE ACCESS BY INDEX ROWID     | NEIE03M00     |     1 |    29 |     1   (0)| 00:00:01 |
|*  6 |    INDEX RANGE SCAN DESCENDING    | NEIE03M00_U10 |  2428 |       |     1   (0)| 00:00:01 |
|*  7 |  VIEW                             |               |    56 |  5208 |     3   (0)| 00:00:01 |
|   8 |   VIEW                            |               |    56 |  3752 |     3   (0)| 00:00:01 |
|   9 |    COUNT                          |               |       |       |            |          |
|  10 |     NESTED LOOPS                  |               |       |       |            |          |
|  11 |      NESTED LOOPS                 |               |    56 |  3752 |     3   (0)| 00:00:01 |
|  12 |       NESTED LOOPS                |               |    56 |  2128 |     2   (0)| 00:00:01 |
|* 13 |        INDEX UNIQUE SCAN          | NEAA09M00_U1  |     1 |     4 |     1   (0)| 00:00:01 |
|  14 |        TABLE ACCESS BY INDEX ROWID| NEIE02M10     |    56 |  1904 |     1   (0)| 00:00:01 |
|* 15 |         INDEX RANGE SCAN          | NEIE02M10_N20 |     4 |       |     1   (0)| 00:00:01 |
|* 16 |       INDEX UNIQUE SCAN           | NEIE02M00_U10 |     1 |       |     1   (0)| 00:00:01 |
|  17 |      TABLE ACCESS BY INDEX ROWID  | NEIE02M00     |     1 |    29 |     1   (0)| 00:00:01 |
---------------------------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - filter(ROWNUM=1)
   2 - filter("X"."TRAN_DT"<="SY"."NFXZ_DT"())
   3 - access("X"."ASST_NO"=:B1)
   4 - filter(ROWNUM=1)
   5 - filter("Y"."DEPR_DT"<="SY"."NFXZ_DT"())
   6 - access("Y"."ASST_NO"=:B1)
   7 - filter("A"."SEQ"="MAX_SEQ")
  13 - access("B"."DEPT_CODE"='051')
  15 - access("A"."RCV_DEPT"='051' AND "A"."TRAN_DT"<="SY"."NFXZ_DT"())
  16 - access("C"."ASST_NO"="A"."ASST_NO")


Statistics
----------------------------------------------------------
       2459  recursive calls
          0  db block gets
      27231  consistent gets
          0  physical reads
          0  redo size
      14397  bytes sent via SQL*Net to client
        751  bytes received via SQL*Net from client
         23  SQL*Net roundtrips to/from client
          0  sorts (memory)
          0  sorts (disk)
        320  rows processed
