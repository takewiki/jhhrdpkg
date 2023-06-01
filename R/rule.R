#' 摘要同步src同步到ods
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' ruleVoucherSourseToOds_sync()
ruleVoucherSourseToOds_sync<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0("insert into  rds_hrv_ods_rule_voucher
  SELECT [FNumber]
      ,[FName]
      ,[FExpenseOrgID]
      ,[FTaxDeclarationOrg]
      ,[FBankType]
      ,[FCategoryType]
  FROM rds_hrv_src_rule_voucher
  WHERE FNumber NOT  IN
  (SELECT FNumber FROM rds_hrv_ods_rule_voucher)"
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
#' rule_sync()
rule_sync <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  jhhrdpkg::ruleVoucherSourseToOds_sync(token = token)
}
