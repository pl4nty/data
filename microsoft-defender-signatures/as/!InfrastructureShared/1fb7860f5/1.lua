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
L1_1 = hstrlog
L1_1 = L1_1[12]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[13]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[14]
L1_1 = L1_1.matched
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = hstrlog
L1_1 = L1_1[15]
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
L2_1 = 0
L3_1 = hstrlog
L3_1 = L3_1[12]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = hstrlog
L3_1 = L3_1[13]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = hstrlog
L3_1 = L3_1[14]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = hstrlog
L3_1 = L3_1[15]
L3_1 = L3_1.matched
if L3_1 then
  L2_1 = L2_1 + 1
end
L3_1 = 0
L4_1 = hstrlog
L4_1 = L4_1[16]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = hstrlog
L4_1 = L4_1[17]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = hstrlog
L4_1 = L4_1[18]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = hstrlog
L4_1 = L4_1[19]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = hstrlog
L4_1 = L4_1[20]
L4_1 = L4_1.matched
if L4_1 then
  L3_1 = L3_1 + 1
end
L4_1 = 0
L5_1 = hstrlog
L5_1 = L5_1[21]
L5_1 = L5_1.matched
if L5_1 then
  L4_1 = L4_1 + 1
end
if 3 <= L0_1 and 1 <= L1_1 or 1 <= L2_1 or 1 <= L3_1 then
  L5_1 = not L4_1
  if 1 <= L5_1 then
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
