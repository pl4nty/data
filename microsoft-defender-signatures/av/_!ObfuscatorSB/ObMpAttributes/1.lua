local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "SCPT:Worm:VBS/Jenxcus!Crypt32"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 10000 or 700000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readprotection
L2_1 = false
L1_1(L2_1)
L1_1 = mp
L1_1 = L1_1.readfile
L2_1 = 0
L3_1 = 8192
L1_1 = L1_1(L2_1, L3_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "public%sfunction%s(%l%l%l%l-)%("
L2_1 = L2_1(L3_1, L4_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L4_1 = L1_1
L3_1 = L1_1.match
L5_1 = "\r\n?\t(%l%l%l%l-)%s=%s\"%x%x%x%x%x%x%x%x%x%x-"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L4_1 = L1_1
  L3_1 = L1_1.match
  L5_1 = "\r\n?\t(%l%l%l%l-)%s=%s-chrw%(%d%d%d?%)%s&%schrw%(%d%d%d?%)"
  L3_1 = L3_1(L4_1, L5_1)
end
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = L0_1 - 8192
L5_1 = L0_1 - L4_1
L6_1 = mp
L6_1 = L6_1.readfile
L7_1 = L4_1
L8_1 = L5_1
L6_1 = L6_1(L7_1, L8_1)
L7_1 = string
L7_1 = L7_1.lower
L8_1 = L6_1
L7_1 = L7_1(L8_1)
L6_1 = L7_1
L8_1 = L6_1
L7_1 = L6_1.match
L9_1 = "execute%s-%((%l%l%l%l-)%s-%(%s-[^%l]-%l-[^%l]-%(%d%d%d?%)%s-,(%l%l%l%l-)%)%)"
L7_1, L8_1 = L7_1(L8_1, L9_1)
if L7_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
if L8_1 == nil then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
if L2_1 ~= L7_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
if L3_1 ~= L8_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = mp
L9_1 = L9_1.SUSPICIOUS
return L9_1
