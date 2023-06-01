#' 摘要同步src同步到ods
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' dsSalarySourseToOds_sync()
dsSalarySourseToOds_sync<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0(
    "insert into   rds_hrv_ods_ds_salary
  SELECT [FExpenseOrgID]
      ,[FTaxDeclarationOrg]
      ,[FBankType]
      ,[FAccount]
      ,[FHightechDept]
      ,[FRdProject]
      ,[FCpayAmount]
      ,[FFixdCost]
      ,[FScraprateCost]
      ,[FSocialSecurityAmt]
      ,[FAccumulationFundAmt]
      ,[FOtherAmt]
      ,[FIncomeTaxAmt]
      ,[FActualAmount]
      ,[FYear]
      ,[FMonth]
      ,[FVoucher]
      ,[FCategoryType]
      ,[FNumber]
      ,[FSeq]
      ,[FDate]
      ,[FOldDept]
  FROM rds_hrv_src_ds_salary  A
  where  A.FNumber  NOT  IN
   (SELECT FNumber FROM rds_hrv_ods_ds_salary)"


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
#'dsSocialsecuritySourseToOds_sync()
dsSocialsecuritySourseToOds_sync<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0(
    "insert into rds_hrv_ods_ds_socialsecurity
  SELECT [FExpenseOrgID]
      ,[FTaxDeclarationOrg]
      ,[FBankType]
      ,[FHightechDept]
      ,[FAccount]
      ,[FRdProject]
      ,[FComPensionBenefitsAmt]
      ,[FComMedicareAmt]
      ,[FComMedicareOfSeriousAmt]
      ,[FComDisabilityBenefitsAmt]
      ,[FComOffsiteElseAmt]
      ,[FComWorklessInsuranceAmt]
      ,[FComInjuryInsuranceAmt]
      ,[FComMaternityInsuranceAmt]
      ,[FComAllSocialSecurityAmt]
      ,[FComAccumulationFundAmt]
      ,[FComAllSoSeAcFuAmt]
      ,[FEmpPensionBenefitsAmt]
      ,[FEmpMedicareAmt]
      ,[FEmpMedicareOfSeriousAmt]
      ,[FEmpWorklessInsuranceAmt]
      ,[FEmpAllSocialSecurityAmt]
      ,[FEmpAccumulationFundAmt]
      ,[FEmpAllSoSeAcFuAmt]
      ,[FAllSocialSecurityAmt]
      ,[FAllAccumulationFundAmt]
      ,[FAllAmount]
      ,[FManagementAmount]
      ,[FYear]
      ,[FMonth]
      ,[FVoucher]
      ,[FCategoryType]
      ,[FNumber]
      ,[FSeq]
      ,[FDate]
      ,[FOldDept]
  FROM rds_hrv_src_ds_socialsecurity   A
  where  A.FNumber  NOT  IN
   (SELECT FNumber FROM rds_hrv_ods_ds_socialsecurity)"
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
#'dsRddetailSourseToOds_sync()
dsRddetailSourseToOds_sync<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0(
    "insert into   rds_hrv_ods_ds_rddetail
SELECT [FNO]
      ,[FSalaryType]
      ,[FYear]
      ,[FMonth]
      ,[FOldDept]
      ,[FHightechDept]
      ,[FStaffName]
      ,[FExpenseOrgID]
      ,[FTaxDeclarationOrg]
      ,[FNumber]
      ,[FRdProject]
      ,[FRdProjectCost]
  FROM rds_hrv_src_ds_rddetail  A
   where  A.FNumber  NOT  IN
   (SELECT FNumber FROM rds_hrv_ods_ds_rddetail)"

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
#'dsNonrddetailSourseToOds_sync()
dsNonrddetailSourseToOds_sync<- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  sql=paste0(
    "insert into   rds_hrv_ods_ds_nonrddetail
  SELECT [FNO]
      ,[FSalaryType]
      ,[FYear]
      ,[FMonth]
      ,[FOldDept]
      ,[FHightechDept]
      ,[FStaffName]
      ,[FExpenseOrgID]
      ,[FTaxDeclarationOrg]
      ,[FNumber]
      ,[FNonRdCost]
      ,[FRdProject]
  FROM rds_hrv_src_ds_nonrddetail A
  where  A.FNumber  NOT  IN
   (SELECT FNumber FROM rds_hrv_ods_ds_nonrddetail)")

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
#' ds_sync()
ds_sync <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {
  jhhrdpkg::dsSalarySourseToOds_sync(token = token)
  jhhrdpkg::dsSocialsecuritySourseToOds_sync(token = token)
  jhhrdpkg::dsRddetailSourseToOds_sync(token = token)
  jhhrdpkg::dsNonrddetailSourseToOds_sync(token = token)

}
