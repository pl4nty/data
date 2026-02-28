local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_LOWERCASE
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 <= 5) then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "scanneddocuments_%d%d%d%d+.html"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "scanneddocs_%d%d%d%d+.html"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "commercial doc for inv# rgl/085/2022.shtml"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "documentos%#092820220000.shtml"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 == nil then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "maersk line shipment .shtm"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if L1_1 == nil then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "draft hbl + packing list.shtml"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if L1_1 == nil then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "invoice-38973.shtml"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if L1_1 == nil then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "invoice-38937.shtml"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if L1_1 == nil then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "facsimile_received_+1[[random_digits(6)]]"
                L4_1 = 1
                L5_1 = true
                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                if L1_1 == nil then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "terms & conditions_technical specifications_pdf.html"
                  L4_1 = 1
                  L5_1 = true
                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                  if L1_1 == nil then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = L0_1
                    L3_1 = "swift copy_1612023.zip"
                    L4_1 = 1
                    L5_1 = true
                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                    if L1_1 == nil then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = L0_1
                      L3_1 = "lineonefacs%d%d%d%d+file.html"
                      L1_1 = L1_1(L2_1, L3_1)
                      if L1_1 == nil then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = "po order.pdf.shtml"
                        L4_1 = 1
                        L5_1 = true
                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                        if L1_1 == nil then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = "invoice inv-6830.htm"
                          L4_1 = 1
                          L5_1 = true
                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                          if L1_1 == nil then
                            L1_1 = string
                            L1_1 = L1_1.find
                            L2_1 = L0_1
                            L3_1 = "inquiry po.slx.shtml"
                            L4_1 = 1
                            L5_1 = true
                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                            if L1_1 == nil then
                              L1_1 = string
                              L1_1 = L1_1.find
                              L2_1 = L0_1
                              L3_1 = "payment_advice_2612023.zip"
                              L4_1 = 1
                              L5_1 = true
                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                              if L1_1 == nil then
                                L1_1 = string
                                L1_1 = L1_1.find
                                L2_1 = L0_1
                                L3_1 = "vmail_1513456-4784_01_23_2023.html"
                                L4_1 = 1
                                L5_1 = true
                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                if L1_1 == nil then
                                  L1_1 = string
                                  L1_1 = L1_1.find
                                  L2_1 = L0_1
                                  L3_1 = "po_300000002140033_adco119189_0.pdf.shtml"
                                  L4_1 = 1
                                  L5_1 = true
                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                  if L1_1 == nil then
                                    L1_1 = string
                                    L1_1 = L1_1.find
                                    L2_1 = L0_1
                                    L3_1 = "eft_1807_1262023.htm"
                                    L4_1 = 1
                                    L5_1 = true
                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                    if L1_1 == nil then
                                      L1_1 = string
                                      L1_1 = L1_1.find
                                      L2_1 = L0_1
                                      L3_1 = "invoice1923119-6.html"
                                      L4_1 = 1
                                      L5_1 = true
                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                      if L1_1 == nil then
                                        L1_1 = string
                                        L1_1 = L1_1.find
                                        L2_1 = L0_1
                                        L3_1 = "ct19702321050-20230220204952905-179-7.html"
                                        L4_1 = 1
                                        L5_1 = true
                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                        if L1_1 == nil then
                                          L1_1 = string
                                          L1_1 = L1_1.find
                                          L2_1 = L0_1
                                          L3_1 = "abschlagsrechnung gkk kiel hasselfelde 40 (pegasus-demolition).img"
                                          L4_1 = 1
                                          L5_1 = true
                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                          if L1_1 == nil then
                                            L1_1 = string
                                            L1_1 = L1_1.find
                                            L2_1 = L0_1
                                            L3_1 = "awb#68337.shtml"
                                            L4_1 = 1
                                            L5_1 = true
                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                            if L1_1 == nil then
                                              L1_1 = string
                                              L1_1 = L1_1.find
                                              L2_1 = L0_1
                                              L3_1 = "quotation mt5011124 (po2851/2042).shtml"
                                              L4_1 = 1
                                              L5_1 = true
                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                              if L1_1 == nil then
                                                L1_1 = string
                                                L1_1 = L1_1.find
                                                L2_1 = L0_1
                                                L3_1 = "purchase order [po#6910000309].shtml"
                                                L4_1 = 1
                                                L5_1 = true
                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                if L1_1 == nil then
                                                  L1_1 = string
                                                  L1_1 = L1_1.find
                                                  L2_1 = L0_1
                                                  L3_1 = "_employee_benefits_0705vxtsndugfbuyaz5b6sad6.htm"
                                                  L4_1 = 1
                                                  L5_1 = true
                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                  if L1_1 == nil then
                                                    goto lbl_244
                                                  end
                                                end
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_244::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
