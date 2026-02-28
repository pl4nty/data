local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "DllSideLoading_Vulnerable"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = #L0_1
  if L1_1 ~= 0 then
    goto lbl_13
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_13::
L1_1 = table_dedup
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = set_research_data
L2_1 = "VulnerableBinaries"
L3_1 = table
L3_1 = L3_1.concat
L4_1 = L0_1
L5_1 = "|"
L3_1 = L3_1(L4_1, L5_1)
L4_1 = false
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
