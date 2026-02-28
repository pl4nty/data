local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 == nil or 31457280 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "BM"
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = #L1_1
  if not (L2_1 < 1) then
    goto lbl_23
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_FULL
L2_1 = L2_1(L3_1)
if L2_1 == nil or L2_1 == "" then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = "enum_bm_attributes"
L4_1 = AppendToRollingQueue
L5_1 = L3_1
L6_1 = L2_1
L7_1 = table
L7_1 = L7_1.concat
L8_1 = L1_1
L9_1 = "|"
L7_1, L8_1, L9_1 = L7_1(L8_1, L9_1)
L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
