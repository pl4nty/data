local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = false
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
L2_1 = {}
L3_1 = ":Python/"
L4_1 = ":SH/"
L5_1 = ":Script/"
L6_1 = ":Linux/"
L7_1 = "SCPT"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L3_1 = "enum_script_attributes"
L4_1 = ipairs
L5_1 = L2_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = mp
  L9_1 = L9_1.enum_mpattributesubstring
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  if L9_1 ~= nil then
    L10_1 = #L9_1
    if 1 <= L10_1 then
      L10_1 = AppendToRollingQueue
      L11_1 = L3_1
      L12_1 = L1_1
      L13_1 = table
      L13_1 = L13_1.concat
      L14_1 = L9_1
      L15_1 = "|"
      L13_1, L14_1, L15_1 = L13_1(L14_1, L15_1)
      L10_1(L11_1, L12_1, L13_1, L14_1, L15_1)
      L0_1 = true
    end
  end
end
if L0_1 == false then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
