#' 摘要同步src同步到ods
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' mdFnoteSourseToOds_sync()
mdFnoteSourseToOds_sync<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("insert  into   rds_hrv_ods_md_fnote
  SELECT [FOrgType]
      ,[FCategoryType]
      ,[Fexample]
  FROM rds_hrv_src_md_fnote  A
  where not exists
  (SELECT * FROM rds_hrv_src_md_fnote  B
  WHERE A.FOrgType =B.FOrgType
  AND A.FCategoryType=B.FCategoryType
  AND A.Fexample =B.Fexample  )")

  res=tsda::sql_insert2(token = token, sql_str = sql)
  return(res)
}

#' 摘要同步src同步到ods
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' mdAcctSourseToOds_sync()
mdAcctSourseToOds_sync<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("insert  into rds_hrv_ods_md_acct
  SELECT [FAccountNumber]
      ,[FAccountName]
      ,[FAccountNameComplete]
      ,[FBalanceType]
      ,[FAccountType]
      ,[FCurrencyTranslation]
      ,[FLexitemProperty]
      ,[FStatus]
      ,[FFirstAcct]
  FROM rds_hrv_src_md_acct  A
  WHERE A.FAccountNumber  NOT IN
  (SELECT FAccountNumber FROM rds_hrv_ods_md_acct)"
  )
  res=tsda::sql_insert2(token = token, sql_str = sql)
  return(res)

}
#' 摘要同步src同步到ods
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' mdDeptSourseToOds_sync()
mdDeptSourseToOds_sync <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql=paste("insert  into   rds_hrv_ods_md_dept
  SELECT [FDepNameManual]
      ,[FNumber]
      ,[FDepName]
      ,[FDepNameComplete]
      ,[FUserOrg]
      ,[FNotes]
  FROM rds_hrv_src_md_dept  A
   WHERE A.FNumber  NOT IN
  (SELECT FNumber FROM rds_hrv_ods_md_dept)"
  )

  res=tsda::sql_insert2(token = token, sql_str = sql)
  return(res)

}
#' 摘要同步src同步到ods
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' mdAcctreclassSourseToOds_sync()
mdAcctreclassSourseToOds_sync<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {

  sql=paste0("insert  into  rds_hrv_ods_md_acctreclass
  SELECT [FNumber]
        ,[FAccountItemActual]
        ,[FAccountItem]
  FROM rds_hrv_src_md_acctreclass  A
    WHERE A.FNumber  NOT IN
  (SELECT FNumber FROM rds_hrv_ods_md_acctreclass)"
  )

  res=tsda::sql_insert2(token = token, sql_str = sql)
  return(res)

}
#' 摘要同步src同步到ods
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' mdWorkcenterSourseToOds_sync()
mdWorkcenterSourseToOds_sync<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("insert  into  rds_hrv_ods_md_workcenter
  SELECT [FNumber]
      ,[FDept]
  FROM rds_hrv_src_md_workcenter  A
    WHERE A.FNumber  NOT IN
  (SELECT FNumber FROM rds_hrv_ods_md_workcenter)"
  )

  res=tsda::sql_insert2(token = token, sql_str = sql)
  return(res)

}
#' 摘要同步src同步到ods
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' mdRditemSourseToOds_sync()
mdRditemSourseToOds_sync<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("insert into rds_hrv_ods_md_rditem
 SELECT  [FOrg]
      ,[FRDProjectManual]
      ,[FRDProject]
  FROM rds_hrv_src_md_rditem  A
  WHERE NOT EXISTS
  (SELECT * FROM  rds_hrv_src_md_rditem  B
  WHERE A.FOrg = B.FOrg
  AND A.FRDProject = B.FRDProject
  AND A.FRDProjectManual = B.FRDProjectManual)"
  )
  res=tsda::sql_insert2(token = token, sql_str = sql)
  return(res)

}
#' 摘要同步src同步到ods
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' md_sync()
md_sync <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  jhhrdpkg::mdFnoteSourseToOds_sync(token = token)
  jhhrdpkg::mdAcctSourseToOds_sync(token = token)
  jhhrdpkg::mdDeptSourseToOds_sync(token = token)
  jhhrdpkg::mdAcctreclassSourseToOds_sync(token = token)
  jhhrdpkg::mdWorkcenterSourseToOds_sync(token = token)
  jhhrdpkg::mdRditemSourseToOds_sync(token = token)


}



