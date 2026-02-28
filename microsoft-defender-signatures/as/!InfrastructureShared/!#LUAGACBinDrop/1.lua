local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_NEWLYCREATEDHINT
L0_1 = L0_1(L1_1)
if L0_1 ~= true then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_FILEPATH
L0_1 = L0_1(L1_1)
if L0_1 ~= "" then
  L1_1 = string
  L1_1 = L1_1.find
  L2_1 = L0_1
  L3_1 = "\\windows\\microsoft.net\\assembly\\gac_msil\\"
  L4_1 = 1
  L5_1 = true
  L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
  if L1_1 then
    L1_1 = mp
    L1_1 = L1_1.GetCertificateInfo
    L1_1 = L1_1()
    L2_1 = pairs
    L3_1 = L1_1
    L2_1, L3_1, L4_1 = L2_1(L3_1)
    for L5_1, L6_1 in L2_1, L3_1, L4_1 do
      L7_1 = L6_1.Signers
      if L7_1 == nil then
        L7_1 = mp
        L7_1 = L7_1.set_mpattribute
        L8_1 = "Lua:GACUnsignedBinDrop"
        L7_1(L8_1)
      end
    end
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
