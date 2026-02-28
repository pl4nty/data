local L0_1, L1_1, L2_1, L3_1, L4_1
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
L1_1 = hstrlog
L1_1 = L1_1[3]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[4]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[6]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[7]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = 0
L2_1 = hstrlog
L2_1 = L2_1[8]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = hstrlog
L2_1 = L2_1[9]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = hstrlog
L2_1 = L2_1[10]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = hstrlog
L2_1 = L2_1[11]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = hstrlog
L2_1 = L2_1[12]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = hstrlog
L2_1 = L2_1[13]
L2_1 = L2_1.matched
if L2_1 then
  L1_1 = L1_1 + 1
end
L2_1 = 0
L3_1 = hstrlog
L3_1 = L3_1[1]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = hstrlog
L3_1 = L3_1[2]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = 0
L4_1 = hstrlog
L4_1 = L4_1[3]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = hstrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = hstrlog
L4_1 = L4_1[5]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = hstrlog
L4_1 = L4_1[6]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = hstrlog
L4_1 = L4_1[7]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = mp
L4_1 = L4_1.getfilesize
L4_1 = L4_1()
if L4_1 < 200000 and (3 <= L0_1 and 3 <= L1_1 or 1 <= L2_1 and 1 <= L3_1) then
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
