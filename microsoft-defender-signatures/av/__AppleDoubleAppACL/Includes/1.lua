local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_FULL
L0_1 = L0_1(L1_1)
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "->"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
L1_1 = L1_1 ~= nil
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.find
L3_1 = L0_1
L4_1 = "^/Users/.-/Downloads/"
L5_1 = 1
L6_1 = false
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
L2_1 = L2_1 ~= nil
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = L0_1
L5_1 = "->"
L6_1 = "|"
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = split
L5_1 = L3_1
L6_1 = "|"
L4_1 = L4_1(L5_1, L6_1)
L5_1 = #L4_1
L5_1 = L5_1 == 2
if not L5_1 then
  L6_1 = mp
  L6_1 = L6_1.CLEAN
  return L6_1
end
L6_1 = L4_1[2]
L7_1 = string
L7_1 = L7_1.find
L8_1 = L6_1
L9_1 = "/"
L10_1 = 1
L11_1 = true
L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
L7_1 = L7_1 == nil
if not L7_1 then
  L8_1 = mp
  L8_1 = L8_1.CLEAN
  return L8_1
end
L8_1 = mp
L8_1 = L8_1.INFECTED
return L8_1
