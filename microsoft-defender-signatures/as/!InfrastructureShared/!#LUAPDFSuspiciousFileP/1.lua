local L0_1, L1_1, L2_1, L3_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1)
if L0_1 ~= nil then
  L1_1 = string
  L1_1 = L1_1.len
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if not (L1_1 <= 5) then
    goto lbl_22
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_22::
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "normal_5fa%x%x%x%x%x%x%x%x%x%x%.pdf"
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "normal_5fb%x%x%x%x%x%x%x%x%x%x%.pdf"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 == nil then
    L1_1 = string
    L1_1 = L1_1.find
    L2_1 = L0_1
    L3_1 = "normal_5fc%x%x%x%x%x%x%x%x%x%x%.pdf"
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 == nil then
      L1_1 = string
      L1_1 = L1_1.find
      L2_1 = L0_1
      L3_1 = "normal_5fd%x%x%x%x%x%x%x%x%x%x%.pdf"
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 == nil then
        L1_1 = string
        L1_1 = L1_1.find
        L2_1 = L0_1
        L3_1 = "normal_5fe%x%x%x%x%x%x%x%x%x%x%.pdf"
        L1_1 = L1_1(L2_1, L3_1)
        if L1_1 == nil then
          L1_1 = string
          L1_1 = L1_1.find
          L2_1 = L0_1
          L3_1 = "normal_5ff%x%x%x%x%x%x%x%x%x%x%.pdf"
          L1_1 = L1_1(L2_1, L3_1)
          if L1_1 == nil then
            L1_1 = string
            L1_1 = L1_1.find
            L2_1 = L0_1
            L3_1 = "scan_34%d%d+_inv%.pdf"
            L1_1 = L1_1(L2_1, L3_1)
            if L1_1 == nil then
              L1_1 = string
              L1_1 = L1_1.find
              L2_1 = L0_1
              L3_1 = "document_%d%d%d_unpaid_%-1%-12.pdf"
              L1_1 = L1_1(L2_1, L3_1)
              if L1_1 == nil then
                L1_1 = string
                L1_1 = L1_1.find
                L2_1 = L0_1
                L3_1 = "complaintapril_%d%d%d%d+%.pdf"
                L1_1 = L1_1(L2_1, L3_1)
                if L1_1 == nil then
                  L1_1 = string
                  L1_1 = L1_1.find
                  L2_1 = L0_1
                  L3_1 = "inv%(05%-10%)copy#%d+%.pdf"
                  L1_1 = L1_1(L2_1, L3_1)
                  if L1_1 == nil then
                    L1_1 = string
                    L1_1 = L1_1.find
                    L2_1 = L0_1
                    L3_1 = "claim%-11%-2%-%d%d%d%a%a%a%d%d%d%.pdf"
                    L1_1 = L1_1(L2_1, L3_1)
                    if L1_1 == nil then
                      L1_1 = string
                      L1_1 = L1_1.find
                      L2_1 = L0_1
                      L3_1 = "claim%-nov%-2%-%d%d%d%a%a%a%d%d%d%.pdf"
                      L1_1 = L1_1(L2_1, L3_1)
                      if L1_1 == nil then
                        L1_1 = string
                        L1_1 = L1_1.find
                        L2_1 = L0_1
                        L3_1 = "claim%-november%-2%-%d%d%d%a%a%a%d%d%d%.pdf"
                        L1_1 = L1_1(L2_1, L3_1)
                        if L1_1 == nil then
                          L1_1 = string
                          L1_1 = L1_1.find
                          L2_1 = L0_1
                          L3_1 = "claim%-11%-2%-%d%d%d%a%a%a%d%d%d%-23%.pdf"
                          L1_1 = L1_1(L2_1, L3_1)
                          if L1_1 == nil then
                            L1_1 = string
                            L1_1 = L1_1.find
                            L2_1 = L0_1
                            L3_1 = "claim%-nov%-2%-%d%d%d%a%a%a%d%d%d%-23%.pdf"
                            L1_1 = L1_1(L2_1, L3_1)
                            if L1_1 == nil then
                              L1_1 = string
                              L1_1 = L1_1.find
                              L2_1 = L0_1
                              L3_1 = "claim%-november%-2%-%d%d%d%a%a%a%d%d%d%-23%.pdf"
                              L1_1 = L1_1(L2_1, L3_1)
                              if L1_1 == nil then
                                goto lbl_137
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
::lbl_137::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
