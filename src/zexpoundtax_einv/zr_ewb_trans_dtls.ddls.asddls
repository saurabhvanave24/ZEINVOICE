@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transporter Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_EWB_TRANS_DTLS
  as select from I_BillingDocumentBasic as _Header
  left outer join I_BillingDocumentPartner as _Partner on _Header.BillingDocument  = _Partner.BillingDocument and
                                                          _Partner.PartnerFunction = 'ZT' 
  left outer join I_Customer as _Customer on _Partner.Customer = _Customer.Customer
{
  key _Header.BillingDocument     as BillingDocument,
  key _Header.CompanyCode         as CompanyCode,
  key _Header.BillingDocumentType as BillingDocumentType,
      _Header.YY1_VehicleNo2_BDH  as VehNo,
      _Header.YY1_VehicleType_BDH as VehType,
      _Header.YY1_LUTNO2_BDH      as LutNo,
      _Header.YY1_LRno_BDH        as LrNo,
      _Header.YY1_LRdate_BDH      as LrDate,
      _Partner.Customer           as CustomerNo,
      _Customer.CustomerName      as TransNm,
      _Customer.TaxNumber3        as TransId
}
