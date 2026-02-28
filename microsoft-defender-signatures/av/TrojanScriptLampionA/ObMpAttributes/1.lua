local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_AMSI
if L0_1 == L1_1 then
  L1_1 = pcall
  L2_1 = mp
  L2_1 = L2_1.get_contextdata
  L3_1 = mp
  L3_1 = L3_1.CONTEXT_DATA_AMSI_CONTENTNAME
  L1_1, L2_1 = L1_1(L2_1, L3_1)
  if L1_1 and L2_1 ~= nil then
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L4_1 = "%.zip.+%.vbs$"
    L5_1 = "%.zip.+%.vbe$"
    L6_1 = "%.zip.+%.js$"
    L7_1 = "%.zip.+%.jse$"
    L9_1 = L3_1
    L8_1 = L3_1.match
    L10_1 = L4_1
    L8_1 = L8_1(L9_1, L10_1)
    if not L8_1 then
      L9_1 = L3_1
      L8_1 = L3_1.match
      L10_1 = L5_1
      L8_1 = L8_1(L9_1, L10_1)
      if not L8_1 then
        L9_1 = L3_1
        L8_1 = L3_1.match
        L10_1 = L6_1
        L8_1 = L8_1(L9_1, L10_1)
        if not L8_1 then
          L9_1 = L3_1
          L8_1 = L3_1.match
          L10_1 = L7_1
          L8_1 = L8_1(L9_1, L10_1)
          if not L8_1 then
            goto lbl_51
          end
        end
      end
    end
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
::lbl_51::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
