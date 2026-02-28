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
L3_1 = "electioninterference_[0-9]+.xls"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "inv%-%d%d%d%d%d%d%d+%-%d%d%d%d%d%d%d+.xls"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "payload_1.bin"
    L4_1 = 1
    L5_1 = true
    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "confirm%-%d%d%d%d%d%d%d+%-%d%d%d%d%d%d%d+.xls"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 == nil then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "subscription_%d%d%d%d%d%d%d+.xls"
        L1_1 = L1_1(L2_1, L3_1)
        if L1_1 == nil then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "complaint%-letter%-%d%d%d%d%d%d%d+%-%d%d%d%d2021.xls"
          L1_1 = L1_1(L2_1, L3_1)
          if L1_1 == nil then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "compensationclaim_%d%d%d%d%d%d%d+_%d%d%d%d2021.xls"
            L1_1 = L1_1(L2_1, L3_1)
            if L1_1 == nil then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "compensation%-%d%d%d%d%d%d%d+%-feb%-%d%d%.xlsb"
              L1_1 = L1_1(L2_1, L3_1)
              if L1_1 == nil then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "comission_%d%d%d%d%d%d%d%d%d+_%d%d%d%d2021.xlsm"
                L1_1 = L1_1(L2_1, L3_1)
                if L1_1 == nil then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "debt_%d%d%d%d%d%d%d%d%d+_%d%d%d%d2021.xlsm"
                  L1_1 = L1_1(L2_1, L3_1)
                  if L1_1 == nil then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = L0_1
                    L3_1 = "document%-%d%d%d%d%d%d%d+.xlsm"
                    L1_1 = L1_1(L2_1, L3_1)
                    if L1_1 == nil then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = L0_1
                      L3_1 = "id_card%-%d%d%d%d+.xlsm"
                      L1_1 = L1_1(L2_1, L3_1)
                      if L1_1 == nil then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = "claim_%d%d%d%d%d%d%d+_%d%d%d%d2021.xlsm"
                        L1_1 = L1_1(L2_1, L3_1)
                        if L1_1 == nil then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = "catalog%-%d%d%d%d%d+%.xls"
                          L1_1 = L1_1(L2_1, L3_1)
                          if L1_1 == nil then
                            L1_1 = string
                            L1_1 = L1_1.find
                            L2_1 = L0_1
                            L3_1 = "diagram%-%d%d%d%d%d+.xlsm"
                            L1_1 = L1_1(L2_1, L3_1)
                            if L1_1 == nil then
                              L1_1 = string
                              L1_1 = L1_1.find
                              L2_1 = L0_1
                              L3_1 = "outstanding%-debt%-%d%d%d%d+%-%d%d%d%d2021%.xlsm"
                              L1_1 = L1_1(L2_1, L3_1)
                              if L1_1 == nil then
                                L1_1 = string
                                L1_1 = L1_1.find
                                L2_1 = L0_1
                                L3_1 = "compensation%-%d%d%d%d%d%d%d+%-%d%d%d%d2021%.xls"
                                L1_1 = L1_1(L2_1, L3_1)
                                if L1_1 == nil then
                                  L1_1 = string
                                  L1_1 = L1_1.find
                                  L2_1 = L0_1
                                  L3_1 = "permission%-%d%d%d%d%d%d%d+%-%d%d%d%d2021%.xlsm"
                                  L1_1 = L1_1(L2_1, L3_1)
                                  if L1_1 == nil then
                                    L1_1 = string
                                    L1_1 = L1_1.find
                                    L2_1 = L0_1
                                    L3_1 = "cancel_sub_jpl%d%d%d+%.xlsb"
                                    L1_1 = L1_1(L2_1, L3_1)
                                    if L1_1 == nil then
                                      L1_1 = string
                                      L1_1 = L1_1.find
                                      L2_1 = L0_1
                                      L3_1 = "research%-%d%d%d%d+%.xls"
                                      L1_1 = L1_1(L2_1, L3_1)
                                      if L1_1 == nil then
                                        L1_1 = string
                                        L1_1 = L1_1.find
                                        L2_1 = L0_1
                                        L3_1 = "outstanding_debt_%d%d%d%d+_%d%d%d%d2021%.xlsm"
                                        L1_1 = L1_1(L2_1, L3_1)
                                        if L1_1 == nil then
                                          L1_1 = string
                                          L1_1 = L1_1.find
                                          L2_1 = L0_1
                                          L3_1 = "funds_withdrawal_%d%d%d%d+_%d%d%d%d2021%.xlsm"
                                          L1_1 = L1_1(L2_1, L3_1)
                                          if L1_1 == nil then
                                            L1_1 = string
                                            L1_1 = L1_1.find
                                            L2_1 = L0_1
                                            L3_1 = "decline_%d%d%d%d%d+_%d%d%d%d2021%.xlsm"
                                            L1_1 = L1_1(L2_1, L3_1)
                                            if L1_1 == nil then
                                              L1_1 = string
                                              L1_1 = L1_1.find
                                              L2_1 = L0_1
                                              L3_1 = "rebate_%d%d%d%d%d+_%d%d%d%d2021%.xlsm"
                                              L1_1 = L1_1(L2_1, L3_1)
                                              if L1_1 == nil then
                                                L1_1 = string
                                                L1_1 = L1_1.find
                                                L2_1 = L0_1
                                                L3_1 = "document%-%d%d%-%d%d%d%d%.xls"
                                                L1_1 = L1_1(L2_1, L3_1)
                                                if L1_1 == nil then
                                                  L1_1 = string
                                                  L1_1 = L1_1.find
                                                  L2_1 = L0_1
                                                  L3_1 = "overdue_debt_%d%d%d%d+_%d%d%d%d2021.xlsm"
                                                  L1_1 = L1_1(L2_1, L3_1)
                                                  if L1_1 == nil then
                                                    L1_1 = string
                                                    L1_1 = L1_1.find
                                                    L2_1 = L0_1
                                                    L3_1 = "document_%d%d%d%d2021_%d%d%d%d+_copy%.xlsm"
                                                    L1_1 = L1_1(L2_1, L3_1)
                                                    if L1_1 == nil then
                                                      L1_1 = string
                                                      L1_1 = L1_1.find
                                                      L2_1 = L0_1
                                                      L3_1 = "debt_%d%d%d%d2021_%d%d%d%d+%.xlsm"
                                                      L1_1 = L1_1(L2_1, L3_1)
                                                      if L1_1 == nil then
                                                        L1_1 = string
                                                        L1_1 = L1_1.find
                                                        L2_1 = L0_1
                                                        L3_1 = "compensation%d%d%d%d%d+2021%.xlsm"
                                                        L1_1 = L1_1(L2_1, L3_1)
                                                        if L1_1 == nil then
                                                          L1_1 = string
                                                          L1_1 = L1_1.find
                                                          L2_1 = L0_1
                                                          L3_1 = "job_presentation_%d%d%d%d+%.xlsb "
                                                          L1_1 = L1_1(L2_1, L3_1)
                                                          if L1_1 == nil then
                                                            L1_1 = string
                                                            L1_1 = L1_1.find
                                                            L2_1 = L0_1
                                                            L3_1 = "cancel_sub_gws%d%d%d%d%d+%.xlsb "
                                                            L1_1 = L1_1(L2_1, L3_1)
                                                            if L1_1 == nil then
                                                              L1_1 = string
                                                              L1_1 = L1_1.find
                                                              L2_1 = L0_1
                                                              L3_1 = "analysis%-%d%d%d%d+.xlsb"
                                                              L1_1 = L1_1(L2_1, L3_1)
                                                              if L1_1 == nil then
                                                                L1_1 = string
                                                                L1_1 = L1_1.find
                                                                L2_1 = L0_1
                                                                L3_1 = "research%-%d%d%d%d+.xlsb"
                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                if L1_1 == nil then
                                                                  L1_1 = string
                                                                  L1_1 = L1_1.find
                                                                  L2_1 = L0_1
                                                                  L3_1 = "cancellation_%d%d%d%d+_%d%d%d%d2021.xlsm"
                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                  if L1_1 == nil then
                                                                    L1_1 = string
                                                                    L1_1 = L1_1.find
                                                                    L2_1 = L0_1
                                                                    L3_1 = "tender%-%d%d%d%d+%.xlsb"
                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                    if L1_1 == nil then
                                                                      L1_1 = string
                                                                      L1_1 = L1_1.find
                                                                      L2_1 = L0_1
                                                                      L3_1 = "_cargo_2021%.%d%d%.%d%d%.xlsb"
                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                      if L1_1 == nil then
                                                                        L1_1 = string
                                                                        L1_1 = L1_1.find
                                                                        L2_1 = L0_1
                                                                        L3_1 = "_ship_2021%.%d%d%.%d%d%.xlsb"
                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                        if L1_1 == nil then
                                                                          L1_1 = string
                                                                          L1_1 = L1_1.find
                                                                          L2_1 = L0_1
                                                                          L3_1 = "proffer%-%d%d%d%d%d%d+%.xlsm"
                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                          if L1_1 == nil then
                                                                            L1_1 = string
                                                                            L1_1 = L1_1.find
                                                                            L2_1 = L0_1
                                                                            L3_1 = "complaint_letter_%d%d%d%d%d%d+_%d%d%d%d2021%.xlsm"
                                                                            L1_1 = L1_1(L2_1, L3_1)
                                                                            if L1_1 == nil then
                                                                              L1_1 = string
                                                                              L1_1 = L1_1.find
                                                                              L2_1 = L0_1
                                                                              L3_1 = "idea%-%d%d%d%d%d%d+%.xlsb"
                                                                              L1_1 = L1_1(L2_1, L3_1)
                                                                              if L1_1 == nil then
                                                                                L1_1 = string
                                                                                L1_1 = L1_1.find
                                                                                L2_1 = L0_1
                                                                                L3_1 = "plan%-%d%d%d%d%d%d+%.xlsb"
                                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                                if L1_1 == nil then
                                                                                  L1_1 = string
                                                                                  L1_1 = L1_1.find
                                                                                  L2_1 = L0_1
                                                                                  L3_1 = "aim%-%d%d%d%d%d%d+%.xlsb"
                                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                                  if L1_1 == nil then
                                                                                    L1_1 = string
                                                                                    L1_1 = L1_1.find
                                                                                    L2_1 = L0_1
                                                                                    L3_1 = "complaint_copy_%d%d%d%d%d%d+_%d%d%d%d2021.xlsm"
                                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                                    if L1_1 == nil then
                                                                                      L1_1 = string
                                                                                      L1_1 = L1_1.find
                                                                                      L2_1 = L0_1
                                                                                      L3_1 = "plan%-%d%d%d%d+%.xlsm"
                                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                                      if L1_1 == nil then
                                                                                        L1_1 = string
                                                                                        L1_1 = L1_1.find
                                                                                        L2_1 = L0_1
                                                                                        L3_1 = "paym_remind_%d%d%d%d+%.xlsm"
                                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                                        if L1_1 == nil then
                                                                                          L1_1 = string
                                                                                          L1_1 = L1_1.find
                                                                                          L2_1 = L0_1
                                                                                          L3_1 = "compens_req_%d%d%d%d+%.xlsm"
                                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                                          if L1_1 == nil then
                                                                                            L1_1 = string
                                                                                            L1_1 = L1_1.find
                                                                                            L2_1 = L0_1
                                                                                            L3_1 = "outstanding%-%d%d%d%d%d%d+%-%d%d%d%d2021%.xlsm"
                                                                                            L1_1 = L1_1(L2_1, L3_1)
                                                                                            if L1_1 == nil then
                                                                                              L1_1 = string
                                                                                              L1_1 = L1_1.find
                                                                                              L2_1 = L0_1
                                                                                              L3_1 = "decline%-%d%d%d%d%d%d+%-%d%d%d%d2021%.xlsm"
                                                                                              L1_1 = L1_1(L2_1, L3_1)
                                                                                              if L1_1 == nil then
                                                                                                L1_1 = string
                                                                                                L1_1 = L1_1.find
                                                                                                L2_1 = L0_1
                                                                                                L3_1 = "fatture_%d%d%d%d+%.xlsm"
                                                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                                                if L1_1 == nil then
                                                                                                  L1_1 = string
                                                                                                  L1_1 = L1_1.find
                                                                                                  L2_1 = L0_1
                                                                                                  L3_1 = "companylist_%d%d%d%d%d%d+%.xlsm"
                                                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                                                  if L1_1 == nil then
                                                                                                    L1_1 = string
                                                                                                    L1_1 = L1_1.find
                                                                                                    L2_1 = L0_1
                                                                                                    L3_1 = "simplydisk_tpeb_tariff_ctoc_%d%d%d%d2021_rev_%d_%d%d%d%d%d+%.xlsm"
                                                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                                                    if L1_1 == nil then
                                                                                                      L1_1 = string
                                                                                                      L1_1 = L1_1.find
                                                                                                      L2_1 = L0_1
                                                                                                      L3_1 = "trial_case_documentation_%d%d%d%d%d%d+%.xlsm"
                                                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                                                      if L1_1 == nil then
                                                                                                        L1_1 = string
                                                                                                        L1_1 = L1_1.find
                                                                                                        L2_1 = L0_1
                                                                                                        L3_1 = "trial_case_documentation%-%d%d%d%d%d%d+%.xlsm"
                                                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                                                        if L1_1 == nil then
                                                                                                          L1_1 = string
                                                                                                          L1_1 = L1_1.find
                                                                                                          L2_1 = L0_1
                                                                                                          L3_1 = "item_positions_receipt_%d%d%d%d%d%d+%.xlsm"
                                                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                                                          if L1_1 == nil then
                                                                                                            L1_1 = string
                                                                                                            L1_1 = L1_1.find
                                                                                                            L2_1 = L0_1
                                                                                                            L3_1 = "item_positions_invoice_%d%d%d%d%d%d+%.xlsm"
                                                                                                            L1_1 = L1_1(L2_1, L3_1)
                                                                                                            if L1_1 == nil then
                                                                                                              L1_1 = string
                                                                                                              L1_1 = L1_1.find
                                                                                                              L2_1 = L0_1
                                                                                                              L3_1 = "pre%-trial_documentation_%d%d%d%d%d%d+%.xlsm"
                                                                                                              L1_1 = L1_1(L2_1, L3_1)
                                                                                                              if L1_1 == nil then
                                                                                                                L1_1 = string
                                                                                                                L1_1 = L1_1.find
                                                                                                                L2_1 = L0_1
                                                                                                                L3_1 = "pre%-trial_information_%d%d%d%d%d+%.xlsm"
                                                                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                                                                if L1_1 == nil then
                                                                                                                  L1_1 = string
                                                                                                                  L1_1 = L1_1.find
                                                                                                                  L2_1 = L0_1
                                                                                                                  L3_1 = "positions_waybill%-%d%d%d%d%d+%.xlsm"
                                                                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                                                                  if L1_1 == nil then
                                                                                                                    L1_1 = string
                                                                                                                    L1_1 = L1_1.find
                                                                                                                    L2_1 = L0_1
                                                                                                                    L3_1 = "prepared_waybill_information%-%d%d%d%d%d+%.xlsm"
                                                                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                                                                    if L1_1 == nil then
                                                                                                                      L1_1 = string
                                                                                                                      L1_1 = L1_1.find
                                                                                                                      L2_1 = L0_1
                                                                                                                      L3_1 = "waybill_documentation_%d%d%d%d%d+.xlsm"
                                                                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                                                                      if L1_1 == nil then
                                                                                                                        L1_1 = string
                                                                                                                        L1_1 = L1_1.find
                                                                                                                        L2_1 = L0_1
                                                                                                                        L3_1 = "item_positions_waybill%-%d%d%d%d%d+%.xlsm"
                                                                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                                                                        if L1_1 == nil then
                                                                                                                          L1_1 = string
                                                                                                                          L1_1 = L1_1.find
                                                                                                                          L2_1 = L0_1
                                                                                                                          L3_1 = "invoice%-%d%d%d%d%d+_2021%d%d%d%d%[%d%]%.xlsb"
                                                                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                                                                          if L1_1 == nil then
                                                                                                                            L1_1 = string
                                                                                                                            L1_1 = L1_1.find
                                                                                                                            L2_1 = L0_1
                                                                                                                            L3_1 = "eoy_tax_document%-%d%d%d%d%d+_2021%d%d%d%d%.xlsb"
                                                                                                                            L1_1 = L1_1(L2_1, L3_1)
                                                                                                                            if L1_1 == nil then
                                                                                                                              L1_1 = string
                                                                                                                              L1_1 = L1_1.find
                                                                                                                              L2_1 = L0_1
                                                                                                                              L3_1 = "details%-%d%d%d+_2021%d%d%d%d%[%d%]%.xlsb"
                                                                                                                              L1_1 = L1_1(L2_1, L3_1)
                                                                                                                              if L1_1 == nil then
                                                                                                                                L1_1 = string
                                                                                                                                L1_1 = L1_1.find
                                                                                                                                L2_1 = L0_1
                                                                                                                                L3_1 = "scan%-%d%d%d%d%d+_2021%d%d%d%d%.xlsb"
                                                                                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                if L1_1 == nil then
                                                                                                                                  L1_1 = string
                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                  L2_1 = L0_1
                                                                                                                                  L3_1 = "invoice_due%-in%-%d%d%d%d%d+_2021%d%d%d%d%.xlsb"
                                                                                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                  if L1_1 == nil then
                                                                                                                                    L1_1 = string
                                                                                                                                    L1_1 = L1_1.find
                                                                                                                                    L2_1 = L0_1
                                                                                                                                    L3_1 = "wages%-no%.%-%d%d%d%d%d+_2021%d%d%d%d%.xlsb"
                                                                                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                    if L1_1 == nil then
                                                                                                                                      L1_1 = string
                                                                                                                                      L1_1 = L1_1.find
                                                                                                                                      L2_1 = L0_1
                                                                                                                                      L3_1 = "signature_page.%-%d%d%d%d%d+_2021%d%d%d%d%.xlsb"
                                                                                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                      if L1_1 == nil then
                                                                                                                                        L1_1 = string
                                                                                                                                        L1_1 = L1_1.find
                                                                                                                                        L2_1 = L0_1
                                                                                                                                        L3_1 = "diagram%-%d%d%d%.doc"
                                                                                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                        if L1_1 == nil then
                                                                                                                                          L1_1 = string
                                                                                                                                          L1_1 = L1_1.find
                                                                                                                                          L2_1 = L0_1
                                                                                                                                          L3_1 = "document_%d%d%d%d%d+%-copy%.xls"
                                                                                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                          if L1_1 == nil then
                                                                                                                                            L1_1 = string
                                                                                                                                            L1_1 = L1_1.find
                                                                                                                                            L2_1 = L0_1
                                                                                                                                            L3_1 = "diagram_%d%d%d%d%d+%.xls"
                                                                                                                                            L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                            if L1_1 == nil then
                                                                                                                                              L1_1 = string
                                                                                                                                              L1_1 = L1_1.find
                                                                                                                                              L2_1 = L0_1
                                                                                                                                              L3_1 = "payment%-%d%d%d%d+%-%d%d%d%d2021%.xls"
                                                                                                                                              L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                              if L1_1 == nil then
                                                                                                                                                L1_1 = string
                                                                                                                                                L1_1 = L1_1.find
                                                                                                                                                L2_1 = L0_1
                                                                                                                                                L3_1 = "claim%-%d%d%d%d+%-%d%d%d%d2021%.xls"
                                                                                                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                if L1_1 == nil then
                                                                                                                                                  L1_1 = string
                                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                                  L2_1 = L0_1
                                                                                                                                                  L3_1 = "compensationclaim%-%d%d%d%d+%-%d%d%d%d2021%.xls"
                                                                                                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                  if L1_1 == nil then
                                                                                                                                                    L1_1 = string
                                                                                                                                                    L1_1 = L1_1.find
                                                                                                                                                    L2_1 = L0_1
                                                                                                                                                    L3_1 = "compensation_reject%-%d%d%d%d%d%d+%-%d%d%d%d2021%.xls"
                                                                                                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                    if L1_1 == nil then
                                                                                                                                                      L1_1 = string
                                                                                                                                                      L1_1 = L1_1.find
                                                                                                                                                      L2_1 = L0_1
                                                                                                                                                      L3_1 = "rebate%-%d%d%d%d%d%d+%-%d%d%d%d2021%.xls"
                                                                                                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                      if L1_1 == nil then
                                                                                                                                                        L1_1 = string
                                                                                                                                                        L1_1 = L1_1.find
                                                                                                                                                        L2_1 = L0_1
                                                                                                                                                        L3_1 = "service%-interrupt%-%d%d%d%d%d+%.xls"
                                                                                                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                        if L1_1 == nil then
                                                                                                                                                          L1_1 = string
                                                                                                                                                          L1_1 = L1_1.find
                                                                                                                                                          L2_1 = L0_1
                                                                                                                                                          L3_1 = "payment_receipt %d%d%d%d%.xls"
                                                                                                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                          if L1_1 == nil then
                                                                                                                                                            L1_1 = string
                                                                                                                                                            L1_1 = L1_1.find
                                                                                                                                                            L2_1 = L0_1
                                                                                                                                                            L3_1 = "sales_receipt %d%d%d%d%.xls"
                                                                                                                                                            L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                            if L1_1 == nil then
                                                                                                                                                              L1_1 = string
                                                                                                                                                              L1_1 = L1_1.find
                                                                                                                                                              L2_1 = L0_1
                                                                                                                                                              L3_1 = "ddt_2021_%d%d%d%d+%.xls"
                                                                                                                                                              L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                              if L1_1 == nil then
                                                                                                                                                                L1_1 = string
                                                                                                                                                                L1_1 = L1_1.find
                                                                                                                                                                L2_1 = L0_1
                                                                                                                                                                L3_1 = "2021_ddt_%d%d%d%d+%.xls"
                                                                                                                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                if L1_1 == nil then
                                                                                                                                                                  L1_1 = string
                                                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                                                  L2_1 = L0_1
                                                                                                                                                                  L3_1 = "purchase_order %d%d%d%d+%.xls"
                                                                                                                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                  if L1_1 == nil then
                                                                                                                                                                    L1_1 = string
                                                                                                                                                                    L1_1 = L1_1.find
                                                                                                                                                                    L2_1 = L0_1
                                                                                                                                                                    L3_1 = "invoice%-%d%d%d%d+_2021%d%d%d%d%.xlsb"
                                                                                                                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                    if L1_1 == nil then
                                                                                                                                                                      L1_1 = string
                                                                                                                                                                      L1_1 = L1_1.find
                                                                                                                                                                      L2_1 = L0_1
                                                                                                                                                                      L3_1 = "claim%-copy%-%d%d%d%d+%.xls"
                                                                                                                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                      if L1_1 == nil then
                                                                                                                                                                        L1_1 = string
                                                                                                                                                                        L1_1 = L1_1.find
                                                                                                                                                                        L2_1 = L0_1
                                                                                                                                                                        L3_1 = "trend%-%d%d%d%d+%.xls"
                                                                                                                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                        if L1_1 == nil then
                                                                                                                                                                          L1_1 = string
                                                                                                                                                                          L1_1 = L1_1.find
                                                                                                                                                                          L2_1 = L0_1
                                                                                                                                                                          L3_1 = "biz%-%d%d%d%d+%.xls"
                                                                                                                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                          if L1_1 == nil then
                                                                                                                                                                            L1_1 = string
                                                                                                                                                                            L1_1 = L1_1.find
                                                                                                                                                                            L2_1 = L0_1
                                                                                                                                                                            L3_1 = "invoice%-%d%d%d%d+_202110%d%d%.zip"
                                                                                                                                                                            L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                            if L1_1 == nil then
                                                                                                                                                                              L1_1 = string
                                                                                                                                                                              L1_1 = L1_1.find
                                                                                                                                                                              L2_1 = L0_1
                                                                                                                                                                              L3_1 = "grade%-%d%d%d%d+%.xls"
                                                                                                                                                                              L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                              if L1_1 == nil then
                                                                                                                                                                                L1_1 = string
                                                                                                                                                                                L1_1 = L1_1.find
                                                                                                                                                                                L2_1 = L0_1
                                                                                                                                                                                L3_1 = "payment_receipt_ %d%d%d%d%.xls"
                                                                                                                                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                if L1_1 == nil then
                                                                                                                                                                                  L1_1 = string
                                                                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                                                                  L2_1 = L0_1
                                                                                                                                                                                  L3_1 = "cmpl%-%d%d%d%d%d+%-nov%-%d%d%.xls"
                                                                                                                                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                  if L1_1 == nil then
                                                                                                                                                                                    L1_1 = string
                                                                                                                                                                                    L1_1 = L1_1.find
                                                                                                                                                                                    L2_1 = L0_1
                                                                                                                                                                                    L3_1 = "miss%-%d%d%d%d%d+%.xls"
                                                                                                                                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                    if L1_1 == nil then
                                                                                                                                                                                      L1_1 = string
                                                                                                                                                                                      L1_1 = L1_1.find
                                                                                                                                                                                      L2_1 = L0_1
                                                                                                                                                                                      L3_1 = "ext%-%d%d%d%d%d+%.xls"
                                                                                                                                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                      if L1_1 == nil then
                                                                                                                                                                                        L1_1 = string
                                                                                                                                                                                        L1_1 = L1_1.find
                                                                                                                                                                                        L2_1 = L0_1
                                                                                                                                                                                        L3_1 = "version%-%d%d%d%d%d+%.xls"
                                                                                                                                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                        if L1_1 == nil then
                                                                                                                                                                                          L1_1 = string
                                                                                                                                                                                          L1_1 = L1_1.find
                                                                                                                                                                                          L2_1 = L0_1
                                                                                                                                                                                          L3_1 = "complaintdetails%-%d%d%d%d%d+%-nov%-%d%d%.xlsb"
                                                                                                                                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                          if L1_1 == nil then
                                                                                                                                                                                            L1_1 = string
                                                                                                                                                                                            L1_1 = L1_1.find
                                                                                                                                                                                            L2_1 = L0_1
                                                                                                                                                                                            L3_1 = "contractcopy%-%d%d%d%d%d+%-nov%-%d%d%.xlsb"
                                                                                                                                                                                            L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                            if L1_1 == nil then
                                                                                                                                                                                              L1_1 = string
                                                                                                                                                                                              L1_1 = L1_1.find
                                                                                                                                                                                              L2_1 = L0_1
                                                                                                                                                                                              L3_1 = "main%-%d%d%d%d%d+%.xlsm"
                                                                                                                                                                                              L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                              if L1_1 == nil then
                                                                                                                                                                                                L1_1 = string
                                                                                                                                                                                                L1_1 = L1_1.find
                                                                                                                                                                                                L2_1 = L0_1
                                                                                                                                                                                                L3_1 = "calculation%-%d%d%d%d%d+%-jan%-%d%d%.xlsb"
                                                                                                                                                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                if L1_1 == nil then
                                                                                                                                                                                                  L1_1 = string
                                                                                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                                                                                  L2_1 = L0_1
                                                                                                                                                                                                  L3_1 = "summary%-%d%d%d%d%d+%-jan%d%d%.xlsb"
                                                                                                                                                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                  if L1_1 == nil then
                                                                                                                                                                                                    L1_1 = string
                                                                                                                                                                                                    L1_1 = L1_1.find
                                                                                                                                                                                                    L2_1 = L0_1
                                                                                                                                                                                                    L3_1 = "summary%-%d%d%d%d%d+%-feb%d%d%.xlsb"
                                                                                                                                                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                    if L1_1 == nil then
                                                                                                                                                                                                      L1_1 = string
                                                                                                                                                                                                      L1_1 = L1_1.find
                                                                                                                                                                                                      L2_1 = L0_1
                                                                                                                                                                                                      L3_1 = "rk%-%d%d%d%d%d+%.xlsb"
                                                                                                                                                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                      if L1_1 == nil then
                                                                                                                                                                                                        L1_1 = string
                                                                                                                                                                                                        L1_1 = L1_1.find
                                                                                                                                                                                                        L2_1 = L0_1
                                                                                                                                                                                                        L3_1 = "rb%-%d%d%d%d%d+%-may%-%d%d%.xltm"
                                                                                                                                                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                        if L1_1 == nil then
                                                                                                                                                                                                          L1_1 = string
                                                                                                                                                                                                          L1_1 = L1_1.find
                                                                                                                                                                                                          L2_1 = L0_1
                                                                                                                                                                                                          L3_1 = "documento_%d%d07%.xls"
                                                                                                                                                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                          if L1_1 == nil then
                                                                                                                                                                                                            L1_1 = string
                                                                                                                                                                                                            L1_1 = L1_1.find
                                                                                                                                                                                                            L2_1 = L0_1
                                                                                                                                                                                                            L3_1 = "message_%d%d072022%.xls"
                                                                                                                                                                                                            L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                            if L1_1 == nil then
                                                                                                                                                                                                              L1_1 = string
                                                                                                                                                                                                              L1_1 = L1_1.find
                                                                                                                                                                                                              L2_1 = L0_1
                                                                                                                                                                                                              L3_1 = "anhang%-%d%d072022%.xls"
                                                                                                                                                                                                              L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                              if L1_1 == nil then
                                                                                                                                                                                                                L1_1 = string
                                                                                                                                                                                                                L1_1 = L1_1.find
                                                                                                                                                                                                                L2_1 = L0_1
                                                                                                                                                                                                                L3_1 = "^documents_%d%d%d%d2022%.xls$"
                                                                                                                                                                                                                L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                                if L1_1 == nil then
                                                                                                                                                                                                                  L1_1 = string
                                                                                                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                                                                                                  L2_1 = L0_1
                                                                                                                                                                                                                  L3_1 = "^notice%-%d%d%.xls$"
                                                                                                                                                                                                                  L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                                  if L1_1 == nil then
                                                                                                                                                                                                                    L1_1 = string
                                                                                                                                                                                                                    L1_1 = L1_1.find
                                                                                                                                                                                                                    L2_1 = L0_1
                                                                                                                                                                                                                    L3_1 = "escanear_%d%d%d%d2022%.xls"
                                                                                                                                                                                                                    L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                                    if L1_1 == nil then
                                                                                                                                                                                                                      L1_1 = string
                                                                                                                                                                                                                      L1_1 = L1_1.find
                                                                                                                                                                                                                      L2_1 = L0_1
                                                                                                                                                                                                                      L3_1 = "2022%-%d%d%-%d%d%-%x%x%x%x%x+_unzipped%.bin"
                                                                                                                                                                                                                      L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                                      if L1_1 == nil then
                                                                                                                                                                                                                        L1_1 = string
                                                                                                                                                                                                                        L1_1 = L1_1.find
                                                                                                                                                                                                                        L2_1 = L0_1
                                                                                                                                                                                                                        L3_1 = "claimdetails%-%d%d%d%d+%-mar%-%d%d%.xlsb"
                                                                                                                                                                                                                        L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                                        if L1_1 == nil then
                                                                                                                                                                                                                          L1_1 = string
                                                                                                                                                                                                                          L1_1 = L1_1.find
                                                                                                                                                                                                                          L2_1 = L0_1
                                                                                                                                                                                                                          L3_1 = "payment%-%d%d%d%d%d+%-feb%-%d%d%.xlsb"
                                                                                                                                                                                                                          L1_1 = L1_1(L2_1, L3_1)
                                                                                                                                                                                                                          if L1_1 == nil then
                                                                                                                                                                                                                            L1_1 = string
                                                                                                                                                                                                                            L1_1 = L1_1.find
                                                                                                                                                                                                                            L2_1 = L0_1
                                                                                                                                                                                                                            L3_1 = ".pdf.ppam"
                                                                                                                                                                                                                            L4_1 = 1
                                                                                                                                                                                                                            L5_1 = true
                                                                                                                                                                                                                            L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                                            if not L1_1 then
                                                                                                                                                                                                                              L1_1 = string
                                                                                                                                                                                                                              L1_1 = L1_1.find
                                                                                                                                                                                                                              L2_1 = L0_1
                                                                                                                                                                                                                              L3_1 = ",pdf.ppam"
                                                                                                                                                                                                                              L4_1 = 1
                                                                                                                                                                                                                              L5_1 = true
                                                                                                                                                                                                                              L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                                              if not L1_1 then
                                                                                                                                                                                                                                L1_1 = string
                                                                                                                                                                                                                                L1_1 = L1_1.find
                                                                                                                                                                                                                                L2_1 = L0_1
                                                                                                                                                                                                                                L3_1 = ",pdf.pps"
                                                                                                                                                                                                                                L4_1 = 1
                                                                                                                                                                                                                                L5_1 = true
                                                                                                                                                                                                                                L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                                                if not L1_1 then
                                                                                                                                                                                                                                  L1_1 = string
                                                                                                                                                                                                                                  L1_1 = L1_1.find
                                                                                                                                                                                                                                  L2_1 = L0_1
                                                                                                                                                                                                                                  L3_1 = "162964708.doc"
                                                                                                                                                                                                                                  L4_1 = 1
                                                                                                                                                                                                                                  L5_1 = true
                                                                                                                                                                                                                                  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                                                  if not L1_1 then
                                                                                                                                                                                                                                    L1_1 = string
                                                                                                                                                                                                                                    L1_1 = L1_1.find
                                                                                                                                                                                                                                    L2_1 = L0_1
                                                                                                                                                                                                                                    L3_1 = "wire_remttance.xlsx"
                                                                                                                                                                                                                                    L4_1 = 1
                                                                                                                                                                                                                                    L5_1 = true
                                                                                                                                                                                                                                    L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                                                    if not L1_1 then
                                                                                                                                                                                                                                      L1_1 = string
                                                                                                                                                                                                                                      L1_1 = L1_1.find
                                                                                                                                                                                                                                      L2_1 = L0_1
                                                                                                                                                                                                                                      L3_1 = "prbz367498955_3_23.xls"
                                                                                                                                                                                                                                      L4_1 = 1
                                                                                                                                                                                                                                      L5_1 = true
                                                                                                                                                                                                                                      L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
                                                                                                                                                                                                                                      if not L1_1 then
                                                                                                                                                                                                                                        goto lbl_854
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
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
do return L1_1 end
::lbl_854::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
