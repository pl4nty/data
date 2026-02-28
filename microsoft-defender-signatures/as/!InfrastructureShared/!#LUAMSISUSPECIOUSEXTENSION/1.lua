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
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if 1024000 < L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = ".pdf.msi"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\194\183pdf.zip"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = ",jpg.iso"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "vhowlvtwzr.dll"
      L4_1 = 1
      L5_1 = true
      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
      if L1_1 == nil then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "_xls.exe"
        L4_1 = 1
        L5_1 = true
        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
        if L1_1 == nil then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "_docx.exe"
          L4_1 = 1
          L5_1 = true
          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
          if L1_1 == nil then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "png.scr"
            L4_1 = 1
            L5_1 = true
            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
            if L1_1 == nil then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = ".pdf.arj"
              L4_1 = 1
              L5_1 = true
              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
              if L1_1 == nil then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "factura.exe"
                L4_1 = 1
                L5_1 = true
                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                if L1_1 == nil then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "-pdf.pif"
                  L4_1 = 1
                  L5_1 = true
                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                  if L1_1 == nil then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = L0_1
                    L3_1 = "__....exe"
                    L4_1 = 1
                    L5_1 = true
                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                    if L1_1 == nil then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = L0_1
                      L3_1 = "hsbc_cus.exe"
                      L4_1 = 1
                      L5_1 = true
                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                      if L1_1 == nil then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = "_pdf.com"
                        L4_1 = 1
                        L5_1 = true
                        L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                        if L1_1 == nil then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = "\194\183pdf.exe"
                          L4_1 = 1
                          L5_1 = true
                          L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                          if L1_1 == nil then
                            L1_1 = string
                            L1_1 = L1_1.find
                            L2_1 = L0_1
                            L3_1 = "_jpg.exe"
                            L4_1 = 1
                            L5_1 = true
                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                            if L1_1 == nil then
                              L1_1 = string
                              L1_1 = L1_1.find
                              L2_1 = L0_1
                              L3_1 = "_xslx.exe"
                              L4_1 = 1
                              L5_1 = true
                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                              if L1_1 == nil then
                                L1_1 = string
                                L1_1 = L1_1.find
                                L2_1 = L0_1
                                L3_1 = "ndringskommandoens sewerman.exe"
                                L4_1 = 1
                                L5_1 = true
                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                if L1_1 == nil then
                                  L1_1 = string
                                  L1_1 = L1_1.find
                                  L2_1 = L0_1
                                  L3_1 = "-pdf.exe"
                                  L4_1 = 1
                                  L5_1 = true
                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                  if L1_1 == nil then
                                    L1_1 = string
                                    L1_1 = L1_1.find
                                    L2_1 = L0_1
                                    L3_1 = "bankninger epiphloedic.exe"
                                    L4_1 = 1
                                    L5_1 = true
                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                    if L1_1 == nil then
                                      L1_1 = string
                                      L1_1 = L1_1.find
                                      L2_1 = L0_1
                                      L3_1 = "_pdf__.+%.%.exe"
                                      L1_1 = L1_1(L2_1, L3_1)
                                      if L1_1 == nil then
                                        L1_1 = string
                                        L1_1 = L1_1.find
                                        L2_1 = L0_1
                                        L3_1 = "%.pdf_%d%d%d+%.exe"
                                        L1_1 = L1_1(L2_1, L3_1)
                                        if L1_1 == nil then
                                          L1_1 = string
                                          L1_1 = L1_1.find
                                          L2_1 = L0_1
                                          L3_1 = "new order_%d%d%d%d%.exe"
                                          L1_1 = L1_1(L2_1, L3_1)
                                          if L1_1 == nil then
                                            L1_1 = string
                                            L1_1 = L1_1.find
                                            L2_1 = L0_1
                                            L3_1 = "%\194\183pdf%d%.zip"
                                            L1_1 = L1_1(L2_1, L3_1)
                                            if not L1_1 then
                                              L1_1 = string
                                              L1_1 = L1_1.find
                                              L2_1 = L0_1
                                              L3_1 = "dhl%d%d%d%d%d%d+%.exe"
                                              L1_1 = L1_1(L2_1, L3_1)
                                              if not L1_1 then
                                                L1_1 = string
                                                L1_1 = L1_1.find
                                                L2_1 = L0_1
                                                L3_1 = "diejc%.dll"
                                                L1_1 = L1_1(L2_1, L3_1)
                                                if not L1_1 then
                                                  L1_1 = string
                                                  L1_1 = L1_1.find
                                                  L2_1 = L0_1
                                                  L3_1 = "pwj%.dll"
                                                  L1_1 = L1_1(L2_1, L3_1)
                                                  if not L1_1 then
                                                    L1_1 = string
                                                    L1_1 = L1_1.find
                                                    L2_1 = L0_1
                                                    L3_1 = "oejfzj%.dll"
                                                    L1_1 = L1_1(L2_1, L3_1)
                                                    if not L1_1 then
                                                      L1_1 = string
                                                      L1_1 = L1_1.find
                                                      L2_1 = L0_1
                                                      L3_1 = "aoshvfu%.dll"
                                                      L1_1 = L1_1(L2_1, L3_1)
                                                      if not L1_1 then
                                                        L1_1 = string
                                                        L1_1 = L1_1.find
                                                        L2_1 = L0_1
                                                        L3_1 = "rfq#%d%d%d%d+%.exe"
                                                        L1_1 = L1_1(L2_1, L3_1)
                                                        if not L1_1 then
                                                          L1_1 = string
                                                          L1_1 = L1_1.find
                                                          L2_1 = L0_1
                                                          L3_1 = "payment details_$%d%d,%d%d%d%.exe"
                                                          L1_1 = L1_1(L2_1, L3_1)
                                                          if not L1_1 then
                                                            L1_1 = string
                                                            L1_1 = L1_1.find
                                                            L2_1 = L0_1
                                                            L3_1 = "_pdf_+%.exe"
                                                            L1_1 = L1_1(L2_1, L3_1)
                                                            if not L1_1 then
                                                              L1_1 = string
                                                              L1_1 = L1_1.find
                                                              L2_1 = L0_1
                                                              L3_1 = "docs%.pdf%.%.+%.gz%.exe"
                                                              L1_1 = L1_1(L2_1, L3_1)
                                                              if not L1_1 then
                                                                L1_1 = string
                                                                L1_1 = L1_1.find
                                                                L2_1 = L0_1
                                                                L3_1 = "hsbc_cus %(%d%)%.exe"
                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                if not L1_1 then
                                                                  L1_1 = string
                                                                  L1_1 = L1_1.find
                                                                  L2_1 = L0_1
                                                                  L3_1 = "%.pdf %(%d%d%d kb%)%.exe"
                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                  if not L1_1 then
                                                                    L1_1 = string
                                                                    L1_1 = L1_1.find
                                                                    L2_1 = L0_1
                                                                    L3_1 = "%.xlsx%(%d%dkb%)%.exe"
                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                    if not L1_1 then
                                                                      L1_1 = string
                                                                      L1_1 = L1_1.find
                                                                      L2_1 = L0_1
                                                                      L3_1 = "factura_%d%d%dpdf%.exe"
                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                      if not L1_1 then
                                                                        L1_1 = string
                                                                        L1_1 = L1_1.find
                                                                        L2_1 = L0_1
                                                                        L3_1 = "pedido junio %d%d%d%d+%-%d%d%d%d%.pdf%.tar$"
                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                        if not L1_1 then
                                                                          L1_1 = string
                                                                          L1_1 = L1_1.find
                                                                          L2_1 = L0_1
                                                                          L3_1 = "request for quotation mq%d%d%d%d%d%.exe$"
                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                          if not L1_1 then
                                                                            goto lbl_332
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
        end
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_332::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
