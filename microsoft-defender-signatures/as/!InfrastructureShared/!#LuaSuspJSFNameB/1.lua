local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_SCANREASON
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.SCANREASON_ONOPEN
if L2_1 ~= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L2_1 ~= L3_1 then
    goto lbl_20
  end
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_FILENAME
L3_1 = L3_1(L4_1)
L0_1 = L3_1
::lbl_20::
if L0_1 == nil then
  L3_1 = string
  L3_1 = L3_1.lower
  L4_1 = mp
  L4_1 = L4_1.getfilename
  L4_1, L5_1 = L4_1()
  L3_1 = L3_1(L4_1, L5_1)
  L1_1 = L3_1
  if L1_1 == nil then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L4_1 = L1_1
  L3_1 = L1_1.match
  L5_1 = "([^\\]+)$"
  L3_1 = L3_1(L4_1, L5_1)
  L0_1 = L3_1
end
if L0_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.match
  L4_1 = L0_1
  L5_1 = "^invoice%-"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    L3_1 = string
    L3_1 = L3_1.match
    L4_1 = L0_1
    L5_1 = "^invoices%-"
    L3_1 = L3_1(L4_1, L5_1)
    if not L3_1 then
      L3_1 = string
      L3_1 = L3_1.match
      L4_1 = L0_1
      L5_1 = "^invoice_"
      L3_1 = L3_1(L4_1, L5_1)
      if not L3_1 then
        L3_1 = string
        L3_1 = L3_1.match
        L4_1 = L0_1
        L5_1 = "^kpinvoice_"
        L3_1 = L3_1(L4_1, L5_1)
        if not L3_1 then
          L3_1 = string
          L3_1 = L3_1.match
          L4_1 = L0_1
          L5_1 = "^scan%-%d+"
          L3_1 = L3_1(L4_1, L5_1)
          if not L3_1 then
            L3_1 = string
            L3_1 = L3_1.match
            L4_1 = L0_1
            L5_1 = "^scan%-%a+%-%d+%-.+"
            L3_1 = L3_1(L4_1, L5_1)
            if not L3_1 then
              L3_1 = string
              L3_1 = L3_1.match
              L4_1 = L0_1
              L5_1 = "^cust%-%a+%-%d+%-.+"
              L3_1 = L3_1(L4_1, L5_1)
              if not L3_1 then
                L3_1 = string
                L3_1 = L3_1.match
                L4_1 = L0_1
                L5_1 = "^order%-"
                L3_1 = L3_1(L4_1, L5_1)
                if not L3_1 then
                  L3_1 = string
                  L3_1 = L3_1.match
                  L4_1 = L0_1
                  L5_1 = "^inv%-%a+%-%d+%-.+"
                  L3_1 = L3_1(L4_1, L5_1)
                  if not L3_1 then
                    L3_1 = string
                    L3_1 = L3_1.match
                    L4_1 = L0_1
                    L5_1 = "^payment%-"
                    L3_1 = L3_1(L4_1, L5_1)
                    if not L3_1 then
                      L3_1 = string
                      L3_1 = L3_1.match
                      L4_1 = L0_1
                      L5_1 = "^acknowledgement%-"
                      L3_1 = L3_1(L4_1, L5_1)
                      if not L3_1 then
                        L3_1 = string
                        L3_1 = L3_1.match
                        L4_1 = L0_1
                        L5_1 = "^rechnung%-"
                        L3_1 = L3_1(L4_1, L5_1)
                        if not L3_1 then
                          L3_1 = string
                          L3_1 = L3_1.match
                          L4_1 = L0_1
                          L5_1 = "^rechnungs%-"
                          L3_1 = L3_1(L4_1, L5_1)
                          if not L3_1 then
                            L3_1 = string
                            L3_1 = L3_1.match
                            L4_1 = L0_1
                            L5_1 = "^gescanntes%-"
                            L3_1 = L3_1(L4_1, L5_1)
                            if not L3_1 then
                              L3_1 = string
                              L3_1 = L3_1.match
                              L4_1 = L0_1
                              L5_1 = "^rech%-%d+"
                              L3_1 = L3_1(L4_1, L5_1)
                              if not L3_1 then
                                L3_1 = string
                                L3_1 = L3_1.match
                                L4_1 = L0_1
                                L5_1 = "^rech%-%a+%-%d+%-.+"
                                L3_1 = L3_1(L4_1, L5_1)
                                if not L3_1 then
                                  L3_1 = string
                                  L3_1 = L3_1.match
                                  L4_1 = L0_1
                                  L5_1 = "^ups__"
                                  L3_1 = L3_1(L4_1, L5_1)
                                  if not L3_1 then
                                    L3_1 = string
                                    L3_1 = L3_1.match
                                    L4_1 = L0_1
                                    L5_1 = "^view__report"
                                    L3_1 = L3_1(L4_1, L5_1)
                                    if not L3_1 then
                                      L3_1 = string
                                      L3_1 = L3_1.match
                                      L4_1 = L0_1
                                      L5_1 = "^document__%d+"
                                      L3_1 = L3_1(L4_1, L5_1)
                                      if not L3_1 then
                                        L3_1 = string
                                        L3_1 = L3_1.match
                                        L4_1 = L0_1
                                        L5_1 = "^re%-invoice%-"
                                        L3_1 = L3_1(L4_1, L5_1)
                                        if not L3_1 then
                                          L3_1 = string
                                          L3_1 = L3_1.match
                                          L4_1 = L0_1
                                          L5_1 = "^dhl__"
                                          L3_1 = L3_1(L4_1, L5_1)
                                          if not L3_1 then
                                            L3_1 = string
                                            L3_1 = L3_1.match
                                            L4_1 = L0_1
                                            L5_1 = "^no%-%a+%-%d+%-.+"
                                            L3_1 = L3_1(L4_1, L5_1)
                                            if not L3_1 then
                                              goto lbl_197
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
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
::lbl_197::
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
