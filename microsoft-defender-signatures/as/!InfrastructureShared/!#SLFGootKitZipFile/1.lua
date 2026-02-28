local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FNAME
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1)
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.match
L2_1 = L0_1
L3_1 = "[%w%_]+_%d+.zip%-%>[%w%s]+%s%d+.js"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = split
L2_1 = L0_1
L3_1 = "-%>"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1[1]
L4_1 = "_"
L5_1 = " "
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = L2_1
L5_1 = "%d+.zip"
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L2_1 = L3_1
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = L1_1[2]
L5_1 = "%d+.js"
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
if L2_1 ~= nil and L3_1 ~= nil and L2_1 == L3_1 then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
