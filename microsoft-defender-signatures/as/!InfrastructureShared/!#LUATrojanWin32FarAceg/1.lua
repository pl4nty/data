local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 512 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 9
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 1162035498 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 13
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 336865834 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = headerpage
L3_1 = 33
L1_1 = L1_1(L2_1, L3_1)
if L1_1 ~= 1163021909 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = headerpage
L3_1 = 87
L1_1 = L1_1(L2_1, L3_1)
if 100 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = string
L3_1 = L3_1.lower
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = 88
L6_1 = L1_1
L4_1, L5_1, L6_1, L7_1, L8_1, L9_1 = L4_1(L5_1, L6_1)
L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1, L8_1, L9_1)
L2_1 = L3_1
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end

function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L3_2 = A0_2
  L2_2 = A0_2.sub
  L5_2 = A1_2
  L4_2 = A1_2.len
  L4_2 = L4_2(L5_2)
  L4_2 = -L4_2
  L2_2 = L2_2(L3_2, L4_2)
  L2_2 = L2_2 == A1_2
  return L2_2
end

function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L3_2 = A0_2
  L2_2 = A0_2.sub
  L4_2 = 1
  L6_2 = A1_2
  L5_2 = A1_2.len
  L5_2, L6_2 = L5_2(L6_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L2_2 = L2_2 == A1_2
  return L2_2
end

L5_1 = L3_1
L6_1 = L2_1
L7_1 = ".exe"
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = L3_1
  L6_1 = L2_1
  L7_1 = "pdf.exe"
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = L3_1
    L6_1 = L2_1
    L7_1 = "doc.exe"
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      L5_1 = L3_1
      L6_1 = L2_1
      L7_1 = "xls.exe"
      L5_1 = L5_1(L6_1, L7_1)
      if not L5_1 then
        L5_1 = L3_1
        L6_1 = L2_1
        L7_1 = "xlsx.exe"
        L5_1 = L5_1(L6_1, L7_1)
        if not L5_1 then
          L5_1 = L3_1
          L6_1 = L2_1
          L7_1 = "jpg.exe"
          L5_1 = L5_1(L6_1, L7_1)
          if not L5_1 then
            L5_1 = L3_1
            L6_1 = L2_1
            L7_1 = "docx.exe"
            L5_1 = L5_1(L6_1, L7_1)
            if not L5_1 then
              L5_1 = L4_1
              L6_1 = L2_1
              L7_1 = "tnt "
              L5_1 = L5_1(L6_1, L7_1)
              if not L5_1 then
                L5_1 = L4_1
                L6_1 = L2_1
                L7_1 = "dhl "
                L5_1 = L5_1(L6_1, L7_1)
                if not L5_1 then
                  L5_1 = L4_1
                  L6_1 = L2_1
                  L7_1 = "po"
                  L5_1 = L5_1(L6_1, L7_1)
                  if not L5_1 then
                    L5_1 = L4_1
                    L6_1 = L2_1
                    L7_1 = "rfq"
                    L5_1 = L5_1(L6_1, L7_1)
                    if not L5_1 then
                      L5_1 = L2_1.find
                      L6_1 = "payment"
                      L7_1 = 1
                      L8_1 = true
                      L5_1 = L5_1(L6_1, L7_1, L8_1)
                      if not L5_1 then
                        L6_1 = L2_1
                        L5_1 = L2_1.find
                        L7_1 = "shipment"
                        L8_1 = 1
                        L9_1 = true
                        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                        if not L5_1 then
                          L6_1 = L2_1
                          L5_1 = L2_1.find
                          L7_1 = "invoice"
                          L8_1 = 1
                          L9_1 = true
                          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                          if not L5_1 then
                            L6_1 = L2_1
                            L5_1 = L2_1.find
                            L7_1 = "swift"
                            L8_1 = 1
                            L9_1 = true
                            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                            if not L5_1 then
                              L6_1 = L2_1
                              L5_1 = L2_1.find
                              L7_1 = "deliver"
                              L8_1 = 1
                              L9_1 = true
                              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                              if not L5_1 then
                                L6_1 = L2_1
                                L5_1 = L2_1.find
                                L7_1 = "statement"
                                L8_1 = 1
                                L9_1 = true
                                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                if not L5_1 then
                                  L6_1 = L2_1
                                  L5_1 = L2_1.find
                                  L7_1 = "order"
                                  L8_1 = 1
                                  L9_1 = true
                                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                  if not L5_1 then
                                    L6_1 = L2_1
                                    L5_1 = L2_1.find
                                    L7_1 = "confirmation"
                                    L8_1 = 1
                                    L9_1 = true
                                    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                    if not L5_1 then
                                      L6_1 = L2_1
                                      L5_1 = L2_1.find
                                      L7_1 = "urgent"
                                      L8_1 = 1
                                      L9_1 = true
                                      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                      if not L5_1 then
                                        L6_1 = L2_1
                                        L5_1 = L2_1.find
                                        L7_1 = "bank "
                                        L8_1 = 1
                                        L9_1 = true
                                        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                        if not L5_1 then
                                          L6_1 = L2_1
                                          L5_1 = L2_1.find
                                          L7_1 = "bank_"
                                          L8_1 = 1
                                          L9_1 = true
                                          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                          if not L5_1 then
                                            L6_1 = L2_1
                                            L5_1 = L2_1.find
                                            L7_1 = "siparis"
                                            L8_1 = 1
                                            L9_1 = true
                                            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                            if not L5_1 then
                                              L6_1 = L2_1
                                              L5_1 = L2_1.find
                                              L7_1 = "pedido"
                                              L8_1 = 1
                                              L9_1 = true
                                              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                              if not L5_1 then
                                                L6_1 = L2_1
                                                L5_1 = L2_1.find
                                                L7_1 = "purchase"
                                                L8_1 = 1
                                                L9_1 = true
                                                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                if not L5_1 then
                                                  L6_1 = L2_1
                                                  L5_1 = L2_1.find
                                                  L7_1 = "fatura"
                                                  L8_1 = 1
                                                  L9_1 = true
                                                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                  if not L5_1 then
                                                    L6_1 = L2_1
                                                    L5_1 = L2_1.find
                                                    L7_1 = "factura"
                                                    L8_1 = 1
                                                    L9_1 = true
                                                    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                    if not L5_1 then
                                                      L6_1 = L2_1
                                                      L5_1 = L2_1.find
                                                      L7_1 = "boleto"
                                                      L8_1 = 1
                                                      L9_1 = true
                                                      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                      if not L5_1 then
                                                        L6_1 = L2_1
                                                        L5_1 = L2_1.find
                                                        L7_1 = "inquiry"
                                                        L8_1 = 1
                                                        L9_1 = true
                                                        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                        if not L5_1 then
                                                          L6_1 = L2_1
                                                          L5_1 = L2_1.find
                                                          L7_1 = "tracking"
                                                          L8_1 = 1
                                                          L9_1 = true
                                                          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                          if not L5_1 then
                                                            L6_1 = L2_1
                                                            L5_1 = L2_1.find
                                                            L7_1 = "quotation"
                                                            L8_1 = 1
                                                            L9_1 = true
                                                            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                            if not L5_1 then
                                                              L6_1 = L2_1
                                                              L5_1 = L2_1.find
                                                              L7_1 = "rfq "
                                                              L8_1 = 1
                                                              L9_1 = true
                                                              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                              if not L5_1 then
                                                                L6_1 = L2_1
                                                                L5_1 = L2_1.find
                                                                L7_1 = "arquivo_fiscal"
                                                                L8_1 = 1
                                                                L9_1 = true
                                                                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                                if not L5_1 then
                                                                  L6_1 = L2_1
                                                                  L5_1 = L2_1.find
                                                                  L7_1 = "invoice"
                                                                  L8_1 = 1
                                                                  L9_1 = true
                                                                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                                  if not L5_1 then
                                                                    L6_1 = L2_1
                                                                    L5_1 = L2_1.find
                                                                    L7_1 = "declaration"
                                                                    L8_1 = 1
                                                                    L9_1 = true
                                                                    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                                    if not L5_1 then
                                                                      L6_1 = L2_1
                                                                      L5_1 = L2_1.find
                                                                      L7_1 = "advice"
                                                                      L8_1 = 1
                                                                      L9_1 = true
                                                                      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
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
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
else
  L5_1 = L3_1
  L6_1 = L2_1
  L7_1 = ".scr"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = L3_1
    L6_1 = L2_1
    L7_1 = "pdf.scr"
    L5_1 = L5_1(L6_1, L7_1)
    if not L5_1 then
      L5_1 = L3_1
      L6_1 = L2_1
      L7_1 = "doc.scr"
      L5_1 = L5_1(L6_1, L7_1)
      if not L5_1 then
        L5_1 = L3_1
        L6_1 = L2_1
        L7_1 = "xls.scr"
        L5_1 = L5_1(L6_1, L7_1)
        if not L5_1 then
          L5_1 = L3_1
          L6_1 = L2_1
          L7_1 = "xlsx.scr"
          L5_1 = L5_1(L6_1, L7_1)
          if not L5_1 then
            L5_1 = L3_1
            L6_1 = L2_1
            L7_1 = "jpg.scr"
            L5_1 = L5_1(L6_1, L7_1)
            if not L5_1 then
              L5_1 = L3_1
              L6_1 = L2_1
              L7_1 = "docx.scr"
              L5_1 = L5_1(L6_1, L7_1)
              if not L5_1 then
                L5_1 = L4_1
                L6_1 = L2_1
                L7_1 = "tnt "
                L5_1 = L5_1(L6_1, L7_1)
                if not L5_1 then
                  L5_1 = L4_1
                  L6_1 = L2_1
                  L7_1 = "dhl "
                  L5_1 = L5_1(L6_1, L7_1)
                  if not L5_1 then
                    L5_1 = L4_1
                    L6_1 = L2_1
                    L7_1 = "po"
                    L5_1 = L5_1(L6_1, L7_1)
                    if not L5_1 then
                      L5_1 = L4_1
                      L6_1 = L2_1
                      L7_1 = "rfq"
                      L5_1 = L5_1(L6_1, L7_1)
                      if not L5_1 then
                        L6_1 = L2_1
                        L5_1 = L2_1.find
                        L7_1 = "payment"
                        L8_1 = 1
                        L9_1 = true
                        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                        if not L5_1 then
                          L6_1 = L2_1
                          L5_1 = L2_1.find
                          L7_1 = "shipment"
                          L8_1 = 1
                          L9_1 = true
                          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                          if not L5_1 then
                            L6_1 = L2_1
                            L5_1 = L2_1.find
                            L7_1 = "invoice"
                            L8_1 = 1
                            L9_1 = true
                            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                            if not L5_1 then
                              L6_1 = L2_1
                              L5_1 = L2_1.find
                              L7_1 = "swift"
                              L8_1 = 1
                              L9_1 = true
                              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                              if not L5_1 then
                                L6_1 = L2_1
                                L5_1 = L2_1.find
                                L7_1 = "deliver"
                                L8_1 = 1
                                L9_1 = true
                                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                if not L5_1 then
                                  L6_1 = L2_1
                                  L5_1 = L2_1.find
                                  L7_1 = "statement"
                                  L8_1 = 1
                                  L9_1 = true
                                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                  if not L5_1 then
                                    L6_1 = L2_1
                                    L5_1 = L2_1.find
                                    L7_1 = "order"
                                    L8_1 = 1
                                    L9_1 = true
                                    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                    if not L5_1 then
                                      L6_1 = L2_1
                                      L5_1 = L2_1.find
                                      L7_1 = "confirmation"
                                      L8_1 = 1
                                      L9_1 = true
                                      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                      if not L5_1 then
                                        L6_1 = L2_1
                                        L5_1 = L2_1.find
                                        L7_1 = "urgent"
                                        L8_1 = 1
                                        L9_1 = true
                                        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                        if not L5_1 then
                                          L6_1 = L2_1
                                          L5_1 = L2_1.find
                                          L7_1 = "bank "
                                          L8_1 = 1
                                          L9_1 = true
                                          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                          if not L5_1 then
                                            L6_1 = L2_1
                                            L5_1 = L2_1.find
                                            L7_1 = "bank_"
                                            L8_1 = 1
                                            L9_1 = true
                                            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                            if not L5_1 then
                                              L6_1 = L2_1
                                              L5_1 = L2_1.find
                                              L7_1 = "siparis"
                                              L8_1 = 1
                                              L9_1 = true
                                              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                              if not L5_1 then
                                                L6_1 = L2_1
                                                L5_1 = L2_1.find
                                                L7_1 = "pedido"
                                                L8_1 = 1
                                                L9_1 = true
                                                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                if not L5_1 then
                                                  L6_1 = L2_1
                                                  L5_1 = L2_1.find
                                                  L7_1 = "purchase"
                                                  L8_1 = 1
                                                  L9_1 = true
                                                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                  if not L5_1 then
                                                    L6_1 = L2_1
                                                    L5_1 = L2_1.find
                                                    L7_1 = "fatura"
                                                    L8_1 = 1
                                                    L9_1 = true
                                                    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                    if not L5_1 then
                                                      L6_1 = L2_1
                                                      L5_1 = L2_1.find
                                                      L7_1 = "factura"
                                                      L8_1 = 1
                                                      L9_1 = true
                                                      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                      if not L5_1 then
                                                        L6_1 = L2_1
                                                        L5_1 = L2_1.find
                                                        L7_1 = "boleto"
                                                        L8_1 = 1
                                                        L9_1 = true
                                                        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                        if not L5_1 then
                                                          L6_1 = L2_1
                                                          L5_1 = L2_1.find
                                                          L7_1 = "inquiry"
                                                          L8_1 = 1
                                                          L9_1 = true
                                                          L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                          if not L5_1 then
                                                            L6_1 = L2_1
                                                            L5_1 = L2_1.find
                                                            L7_1 = "tracking"
                                                            L8_1 = 1
                                                            L9_1 = true
                                                            L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                            if not L5_1 then
                                                              L6_1 = L2_1
                                                              L5_1 = L2_1.find
                                                              L7_1 = "quotation"
                                                              L8_1 = 1
                                                              L9_1 = true
                                                              L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                              if not L5_1 then
                                                                L6_1 = L2_1
                                                                L5_1 = L2_1.find
                                                                L7_1 = "rfq "
                                                                L8_1 = 1
                                                                L9_1 = true
                                                                L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                                if not L5_1 then
                                                                  L6_1 = L2_1
                                                                  L5_1 = L2_1.find
                                                                  L7_1 = "arquivo_fiscal"
                                                                  L8_1 = 1
                                                                  L9_1 = true
                                                                  L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                                  if not L5_1 then
                                                                    L6_1 = L2_1
                                                                    L5_1 = L2_1.find
                                                                    L7_1 = "invoice"
                                                                    L8_1 = 1
                                                                    L9_1 = true
                                                                    L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                                    if not L5_1 then
                                                                      L6_1 = L2_1
                                                                      L5_1 = L2_1.find
                                                                      L7_1 = "declaration"
                                                                      L8_1 = 1
                                                                      L9_1 = true
                                                                      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                                      if not L5_1 then
                                                                        L6_1 = L2_1
                                                                        L5_1 = L2_1.find
                                                                        L7_1 = "advice"
                                                                        L8_1 = 1
                                                                        L9_1 = true
                                                                        L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
                                                                        if not L5_1 then
                                                                          goto lbl_559
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
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
::lbl_559::
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
