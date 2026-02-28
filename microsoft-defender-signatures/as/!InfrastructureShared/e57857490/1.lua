local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = hstrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
L1_1 = hstrlog
L1_1 = L1_1[2]
L1_1 = L1_1.matched
L2_1 = hstrlog
L2_1 = L2_1[3]
L2_1 = L2_1.matched
if not L2_1 then
  L2_1 = hstrlog
  L2_1 = L2_1[4]
  L2_1 = L2_1.matched
end
L3_1 = hstrlog
L3_1 = L3_1[5]
L3_1 = L3_1.matched
if not L3_1 then
  L3_1 = hstrlog
  L3_1 = L3_1[6]
  L3_1 = L3_1.matched
end
L4_1 = hstrlog
L4_1 = L4_1[7]
L4_1 = L4_1.matched
if not L4_1 then
  L4_1 = hstrlog
  L4_1 = L4_1[8]
  L4_1 = L4_1.matched
end
L5_1 = hstrlog
L5_1 = L5_1[9]
L5_1 = L5_1.matched
if not L5_1 then
  L5_1 = hstrlog
  L5_1 = L5_1[10]
  L5_1 = L5_1.matched
  if not L5_1 then
    L5_1 = hstrlog
    L5_1 = L5_1[11]
    L5_1 = L5_1.matched
    if not L5_1 then
      L5_1 = hstrlog
      L5_1 = L5_1[12]
      L5_1 = L5_1.matched
      if not L5_1 then
        L5_1 = hstrlog
        L5_1 = L5_1[13]
        L5_1 = L5_1.matched
      end
    end
  end
end
L6_1 = 0
if L5_1 then
  L6_1 = L6_1 + 1
end
if L3_1 and L4_1 then
  L6_1 = L6_1 + 2
end
if L1_1 and L2_1 then
  L6_1 = L6_1 + 2
end
if L0_1 then
  L6_1 = L6_1 + 1
end
if 3 <= L6_1 then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "HSTR:Win32/Vobfus.gen!Y"
  L7_1(L8_1)
end
if 6 <= L6_1 then
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
if 4 <= L6_1 then
  L7_1 = mp
  L7_1 = L7_1.SUSPICIOUS
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
