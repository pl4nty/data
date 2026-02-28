local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
L1_1 = tostring
L2_1 = headerpage
L1_1 = L1_1(L2_1)
L2_1 = tostring
L3_1 = footerpage
L2_1 = L2_1(L3_1)
L1_1 = L1_1 .. L2_1
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.gmatch
  L3_1 = L1_1
  L4_1 = "(https?://[A-Za-z0-9./]+)/%?servername=msi"
  L2_1, L3_1, L4_1 = L2_1(L3_1, L4_1)
  for L5_1 in L2_1, L3_1, L4_1 do
    if L5_1 ~= nil then
      L6_1 = L0_1[L5_1]
      if not L6_1 then
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = "MpInternal_researchdata=batloaderuri="
        L8_1 = L5_1
        L7_1 = L7_1 .. L8_1
        L6_1(L7_1)
        L0_1[L5_1] = true
      end
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
