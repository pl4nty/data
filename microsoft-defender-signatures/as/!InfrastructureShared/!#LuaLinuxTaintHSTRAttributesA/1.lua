local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "HSTR:Linux"
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 1) then
    goto lbl_13
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_13::
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
if L1_1 == nil or L1_1 == "" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = "enum_hstr_attributes"
L3_1 = AppendToRollingQueue
L4_1 = L2_1
L5_1 = L1_1
L6_1 = table
L6_1 = L6_1.concat
L7_1 = L0_1
L8_1 = "|"
L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
