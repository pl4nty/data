local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = 0
L1_1 = hstrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = 0
L2_1 = hstrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = hstrlog
L2_1 = L2_1[4]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = 0
L3_1 = hstrlog
L3_1 = L3_1[5]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = hstrlog
L3_1 = L3_1[6]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = hstrlog
L3_1 = L3_1[7]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = hstrlog
L3_1 = L3_1[8]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = hstrlog
L3_1 = L3_1[9]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = hstrlog
L3_1 = L3_1[10]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = 0
L4_1 = hstrlog
L4_1 = L4_1[11]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = hstrlog
L4_1 = L4_1[12]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = hstrlog
L4_1 = L4_1[13]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = 0
L5_1 = hstrlog
L5_1 = L5_1[14]
L5_1 = L5_1.matched
if L5_1 then
  L4_1 = L4_1 + 1
end
L5_1 = hstrlog
L5_1 = L5_1[15]
L5_1 = L5_1.matched
if L5_1 then
  L4_1 = L4_1 + 1
end
L5_1 = hstrlog
L5_1 = L5_1[16]
L5_1 = L5_1.matched
if L5_1 then
  L4_1 = L4_1 + 1
end
L5_1 = hstrlog
L5_1 = L5_1[17]
L5_1 = L5_1.matched
if L5_1 then
  L4_1 = L4_1 + 1
end
L5_1 = hstrlog
L5_1 = L5_1[18]
L5_1 = L5_1.matched
if L5_1 then
  L4_1 = L4_1 + 1
end
L5_1 = hstrlog
L5_1 = L5_1[19]
L5_1 = L5_1.matched
if L5_1 then
  L4_1 = L4_1 + 1
end
if L0_1 == 2 or L1_1 == 2 or 3 <= L2_1 or L3_1 == 3 or 3 <= L4_1 then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
