local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 3284386755 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 5
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 3405691582 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 9
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 4294967294 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 13
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 16711935 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 17
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 3924421097 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[1]
if L0_1 ~= 195 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[1]
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[1]
if 196 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[1]
if L0_1 <= 194 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[1]
if 195 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[1]
if L0_1 < 195 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[1]
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
L0_1 = not L0_1
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[1]
L2_1 = 195
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitor
L1_1 = epcode
L1_1 = L1_1[1]
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = epcode
L1_1 = L1_1[1]
L2_1 = 195
L0_1 = L0_1(L1_1, L2_1)
L0_1 = not L0_1
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = epcode
L1_1 = L1_1[1]
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[1]
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[1]
L2_1 = 60
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 60 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 50115 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if 50116 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 <= 50114 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if 50115 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 < 50115 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
L0_1 = not L0_1
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 50115
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitor
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 50115
L0_1 = L0_1(L1_1, L2_1)
L0_1 = not L0_1
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u16
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 15420
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 15420 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 3284386755 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if 3284386756 <= L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 <= 3284386754 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if 3284386755 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 1
L0_1 = L0_1(L1_1, L2_1)
if L0_1 < 3284386755 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
L0_1 = not L0_1
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 3284386755
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitor
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 3284386755
L0_1 = L0_1(L1_1, L2_1)
L0_1 = not L0_1
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitxor
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 0
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 0 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = mp
L1_1 = L1_1.readu_u32
L2_1 = epcode
L3_1 = 1
L1_1 = L1_1(L2_1, L3_1)
L2_1 = 1010580540
L0_1 = L0_1(L1_1, L2_1)
if L0_1 == 1010580540 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readprotection
L1_1 = false
L0_1(L1_1)
L0_1 = mp
L0_1 = L0_1.readfile
L1_1 = 1536
L2_1 = 1024
L0_1 = L0_1(L1_1, L2_1)
L1_1 = mp
L1_1 = L1_1.crc32
L2_1 = -1
L3_1 = L0_1
L4_1 = 1
L5_1 = 1024
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 ~= 3259081459 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
