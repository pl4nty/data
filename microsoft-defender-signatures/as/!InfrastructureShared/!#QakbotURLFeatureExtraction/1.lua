local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = {}
L1_1 = 0
L2_1 = tostring
L3_1 = headerpage
L2_1 = L2_1(L3_1)
L3_1 = tostring
L4_1 = footerpage
L3_1 = L3_1(L4_1)
L2_1 = L2_1 .. L3_1
if L2_1 ~= nil then
  L3_1 = string
  L3_1 = L3_1.gmatch
  L4_1 = L2_1
  L5_1 = "(https?://[-a-zA-Z0-9@:%._/+~#=]*)"
  L3_1, L4_1, L5_1 = L3_1(L4_1, L5_1)
  for L6_1 in L3_1, L4_1, L5_1 do
    if L6_1 ~= nil then
      L7_1 = L0_1[L6_1]
      if not L7_1 then
        L1_1 = L1_1 + 1
        L7_1 = mp
        L7_1 = L7_1.set_mpattribute
        L8_1 = "MpInternal_researchdata=powershelluri="
        L9_1 = L6_1
        L8_1 = L8_1 .. L9_1
        L7_1(L8_1)
        L0_1[L6_1] = true
      end
    end
  end
end
if 8 < L1_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Found:"
  L5_1 = L1_1
  L6_1 = "urls"
  L4_1 = L4_1 .. L5_1 .. L6_1
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "GE8URLsFound"
  L3_1(L4_1)
elseif 2 < L1_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Found:"
  L5_1 = L1_1
  L6_1 = "urls"
  L4_1 = L4_1 .. L5_1 .. L6_1
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "GE3URLsFound"
  L3_1(L4_1)
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
