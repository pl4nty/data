local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
L0_1 = mp
L0_1 = L0_1.hstr_full_log
L0_1 = L0_1()
if L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = 0
L2_1 = L0_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = L0_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = 0
L3_1 = L0_1[3]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = L0_1[4]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = L0_1[5]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = 0
L4_1 = L0_1[7]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = L0_1[8]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = L0_1[9]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = L0_1[10]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = L0_1[11]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = L0_1[12]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = L0_1[13]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = L0_1[14]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
if 1 <= L1_1 and 1 <= L2_1 and 1 <= L3_1 then
  L4_1 = {}
  L5_1 = "sqlservr.exe"
  L6_1 = "sqlps.exe"
  L7_1 = "sqlagent.exe"
  L4_1[1] = L5_1
  L4_1[2] = L6_1
  L4_1[3] = L7_1
  L5_1 = IsProcNameInParentProcessTree
  L6_1 = "cmdhstr"
  L7_1 = L4_1
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
