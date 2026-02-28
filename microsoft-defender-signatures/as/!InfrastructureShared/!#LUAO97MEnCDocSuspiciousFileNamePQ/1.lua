local L0_1, L1_1, L2_1, L3_1
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
L3_1 = "form_%d%d%d%d%d%d+_%d%d%d%d2021%.xls"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "information%[2021%.%d%d%.%d%d_%d%d%-%d%d%]%.xlsb"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "new_working_conditions%[2021%.%d%d%.%d%d_%d%d%-%d%d%]%.xlsb"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "document%[2021%.%d%d%.%d%d_%d%d%-%d%d%]%.xlsb"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 == nil then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "termination letter%.%d%d%d%d+%.xlsb"
        L1_1 = L1_1(L2_1, L3_1)
        if L1_1 == nil then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "termination letter %d%d+%.xlsb"
          L1_1 = L1_1(L2_1, L3_1)
          if L1_1 == nil then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "notificaion%-%d%d%d+_2021%d%d%d%d%.xlsb"
            L1_1 = L1_1(L2_1, L3_1)
            if L1_1 == nil then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "termination_%d%d+%.xlsb"
              L1_1 = L1_1(L2_1, L3_1)
              if L1_1 == nil then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "document%-%d%d+_2021%d%d%d%d%.xlsb"
                L1_1 = L1_1(L2_1, L3_1)
                if L1_1 == nil then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "emergreport%-%d%d%d%d%d%d+%-12%d%d2021%.xlsb"
                  L1_1 = L1_1(L2_1, L3_1)
                  if L1_1 == nil then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = L0_1
                    L3_1 = "reservationdetails%-%d%d%d%d%d%d+%-dec%-%d%d%.xlsb"
                    L1_1 = L1_1(L2_1, L3_1)
                    if L1_1 == nil then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = L0_1
                      L3_1 = "positive_result_%d%d%d%d%d%d%d%d%.xls"
                      L1_1 = L1_1(L2_1, L3_1)
                      if L1_1 == nil then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = "complaint%-%d%d%d%d%d%d+%-dec%-%d%d%.xlsb"
                        L1_1 = L1_1(L2_1, L3_1)
                        if L1_1 == nil then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = "summary%-%d%d%d%d%d%d+%-dec%d%d%.xlsb"
                          L1_1 = L1_1(L2_1, L3_1)
                          if L1_1 == nil then
                            L1_1 = string
                            L1_1 = L1_1.find
                            L2_1 = L0_1
                            L3_1 = "payment_swift_copy_of__62_271%.03%.%.xls"
                            L1_1 = L1_1(L2_1, L3_1)
                            if L1_1 == nil then
                              L1_1 = string
                              L1_1 = L1_1.find
                              L2_1 = L0_1
                              L3_1 = "invoce %d%d mar 23%.doc"
                              L1_1 = L1_1(L2_1, L3_1)
                              if L1_1 == nil then
                                goto lbl_132
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
::lbl_132::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
