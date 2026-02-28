local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = "SLF:Win32/PossibleMasquerading.EA"
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if L2_1 ~= 0 then
    L2_1 = type
    L3_1 = L1_1
    L2_1 = L2_1(L3_1)
    if L2_1 == "table" then
      goto lbl_19
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_19::
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = #L6_1
  if 32 < L7_1 then
    L7_1 = mp
    L7_1 = L7_1.set_mpattribute
    L8_1 = "BM_MT1036.005"
    L7_1(L8_1)
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
