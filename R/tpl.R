#' 摘要同步src同步到ods
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' tplVoucherSourseToOds_sync()
tplVoucherSourseToOds_sync<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("insert  into rds_hrv_ods_tpl_voucher
  SELECT [FNumber]
      ,[FName]
      ,[FCategoryType]
      ,[FSeq]
      ,[FNotes]
      ,[FSubjectNumber]
      ,[FSubjectName]
      ,[FAccountNumber]
      ,[FLexitemProperty]
      ,[FObtainSource]
      ,[FAccountBorrow]
      ,[FAccountLoan]
      ,[FSettleMethod]
      ,[FSettleNumber]
      ,[FAccountBookID]
      ,[FFirstAcct]
      ,[FAccountBorrowSql]
      ,[FAccountLoanSql]
  FROM rds_hrv_src_tpl_voucher
  WHERE FNumber NOT IN
  (SELECT FNumber FROM rds_hrv_ods_tpl_voucher)"
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
#' tpl_sync()
tpl_sync <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  jhhrdpkg::tplVoucherSourseToOds_sync(token = token)
}
