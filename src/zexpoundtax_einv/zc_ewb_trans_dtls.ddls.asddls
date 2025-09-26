@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consuption View for E-WAYBILL'
@Metadata.allowExtensions: true

define view entity ZC_EWB_TRANS_DTLS
  as projection on ZI_EWB_TRANS_DET
{

  key Bukrs,
  key DocNo,
  key doc_year,
  key Doc_Type,
      @EndUserText.label: 'Transporter ID'
      TransId,
      @EndUserText.label: 'Transporter Name'
      TransNm,
      Distance,
      VehNo,
      VehType,
      TransMd,
      TransDocNo,
      TransDt,
      @Semantics.user.createdBy: true
      CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _BILLINGEWB : redirected to parent ZC_BILLING_EWB

}
