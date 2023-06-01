#' 所有数据同步src同步到ods
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' dataAll_sync()
dataAll_sync <- function(token='057A7F0E-F187-4975-8873-AF71666429AB') {

  md_sync(token = token)
  ds_sync(token = token)
  rule_sync(token = token)
  tpl_sync(token = token)

}
