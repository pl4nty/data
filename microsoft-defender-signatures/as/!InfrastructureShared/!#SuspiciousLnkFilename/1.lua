local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = mp
L1_1 = L1_1.getfilename
L1_1, L2_1, L3_1, L4_1, L5_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "nf%-e2017%d+%.lnk"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "pdf%.lnk"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "boleto"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "payment"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 == nil then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "invoice"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if L1_1 == nil then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "fatura"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if L1_1 == nil then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "resultado_consulta"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if L1_1 == nil then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "purchase..?order"
              L1_1 = L1_1(L2_1, L3_1)
              if L1_1 == nil then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "produto..?devolvido"
                L1_1 = L1_1(L2_1, L3_1)
                if L1_1 == nil then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "rechnung"
                  L4_1 = 1
                  L5_1 = true
                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                  if L1_1 == nil then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = L0_1
                    L3_1 = "documentos"
                    L4_1 = 1
                    L5_1 = true
                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                    if L1_1 == nil then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = L0_1
                      L3_1 = "documento"
                      L4_1 = 1
                      L5_1 = true
                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                      if L1_1 == nil then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = "recibo"
                        L4_1 = 1
                        L5_1 = true
                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                        if L1_1 == nil then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = "bole_pdf"
                          L4_1 = 1
                          L5_1 = true
                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                          if L1_1 == nil then
                            L1_1 = string
                            L1_1 = L1_1.find
                            L2_1 = L0_1
                            L3_1 = "notafiscal"
                            L4_1 = 1
                            L5_1 = true
                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                            if L1_1 == nil then
                              L1_1 = string
                              L1_1 = L1_1.find
                              L2_1 = L0_1
                              L3_1 = "arquivo-danf"
                              L4_1 = 1
                              L5_1 = true
                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                              if L1_1 == nil then
                                L1_1 = string
                                L1_1 = L1_1.find
                                L2_1 = L0_1
                                L3_1 = "nf-danfe"
                                L4_1 = 1
                                L5_1 = true
                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                if L1_1 == nil then
                                  L1_1 = string
                                  L1_1 = L1_1.find
                                  L2_1 = L0_1
                                  L3_1 = "nf-e"
                                  L4_1 = 1
                                  L5_1 = true
                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                  if L1_1 == nil then
                                    L1_1 = string
                                    L1_1 = L1_1.find
                                    L2_1 = L0_1
                                    L3_1 = "historico_conversas"
                                    L4_1 = 1
                                    L5_1 = true
                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                    if L1_1 == nil then
                                      L1_1 = string
                                      L1_1 = L1_1.find
                                      L2_1 = L0_1
                                      L3_1 = "nfe_?%d+%.lnk"
                                      L1_1 = L1_1(L2_1, L3_1)
                                      if L1_1 == nil then
                                        L1_1 = string
                                        L1_1 = L1_1.find
                                        L2_1 = L0_1
                                        L3_1 = "curriculo%.lnk"
                                        L1_1 = L1_1(L2_1, L3_1)
                                        if L1_1 == nil then
                                          L1_1 = string
                                          L1_1 = L1_1.find
                                          L2_1 = L0_1
                                          L3_1 = "undelivered-parcel"
                                          L4_1 = 1
                                          L5_1 = true
                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                          if not L1_1 then
                                            L1_1 = string
                                            L1_1 = L1_1.find
                                            L2_1 = L0_1
                                            L3_1 = "delivery-receipt"
                                            L4_1 = 1
                                            L5_1 = true
                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                            if not L1_1 then
                                              L1_1 = string
                                              L1_1 = L1_1.find
                                              L2_1 = L0_1
                                              L3_1 = "documento"
                                              L4_1 = 1
                                              L5_1 = true
                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                              if not L1_1 then
                                                L1_1 = string
                                                L1_1 = L1_1.find
                                                L2_1 = L0_1
                                                L3_1 = "payment"
                                                L4_1 = 1
                                                L5_1 = true
                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                if not L1_1 then
                                                  L1_1 = string
                                                  L1_1 = L1_1.find
                                                  L2_1 = L0_1
                                                  L3_1 = "comprovante"
                                                  L4_1 = 1
                                                  L5_1 = true
                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                  if not L1_1 then
                                                    L1_1 = string
                                                    L1_1 = L1_1.find
                                                    L2_1 = L0_1
                                                    L3_1 = ".doc.lnk"
                                                    L4_1 = 1
                                                    L5_1 = true
                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                    if not L1_1 then
                                                      L1_1 = string
                                                      L1_1 = L1_1.find
                                                      L2_1 = L0_1
                                                      L3_1 = ".pdf.lnk"
                                                      L4_1 = 1
                                                      L5_1 = true
                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                      if not L1_1 then
                                                        L1_1 = string
                                                        L1_1 = L1_1.find
                                                        L2_1 = L0_1
                                                        L3_1 = ".jpg.lnk"
                                                        L4_1 = 1
                                                        L5_1 = true
                                                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                        if not L1_1 then
                                                          L1_1 = string
                                                          L1_1 = L1_1.find
                                                          L2_1 = L0_1
                                                          L3_1 = ".html.lnk"
                                                          L4_1 = 1
                                                          L5_1 = true
                                                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                          if not L1_1 then
                                                            L1_1 = string
                                                            L1_1 = L1_1.find
                                                            L2_1 = L0_1
                                                            L3_1 = "delivery-details"
                                                            L4_1 = 1
                                                            L5_1 = true
                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                            if not L1_1 then
                                                              L1_1 = string
                                                              L1_1 = L1_1.find
                                                              L2_1 = L0_1
                                                              L3_1 = "ground-label"
                                                              L4_1 = 1
                                                              L5_1 = true
                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                              if not L1_1 then
                                                                L1_1 = string
                                                                L1_1 = L1_1.find
                                                                L2_1 = L0_1
                                                                L3_1 = "anexon"
                                                                L4_1 = 1
                                                                L5_1 = true
                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                if not L1_1 then
                                                                  goto lbl_295
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
::lbl_295::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
