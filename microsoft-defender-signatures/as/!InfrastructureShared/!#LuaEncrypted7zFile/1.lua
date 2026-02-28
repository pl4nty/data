local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 < 4096 or 1073741824 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.readu_u64
L2_1 = headerpage
L3_1 = 13
L1_1 = L1_1(L2_1, L3_1)
L2_1 = mp
L2_1 = L2_1.readu_u64
L3_1 = headerpage
L4_1 = 21
L2_1 = L2_1(L3_1, L4_1)
if L1_1 <= 0 or L2_1 <= 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 32 + L1_1
L3_1 = L3_1 + L2_1
if L3_1 <= 4096 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 32 + L1_1
L3_1 = L3_1 + L2_1
if 1073741824 <= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = 32 + L1_1
L3_1 = L3_1 + L2_1
if L0_1 < L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "Lua:7zWithBadFileSize"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L1_1 = 32 + L1_1
L3_1 = L1_1 + 2
if L0_1 < L3_1 or L1_1 <= 0 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.readprotection
L4_1 = false
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.readfile
L4_1 = L1_1
L5_1 = 2
L3_1 = L3_1(L4_1, L5_1)
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = true
L4_1(L5_1)
if L3_1 == 0 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.byte
L5_1 = L3_1
L6_1 = 1
L4_1 = L4_1(L5_1, L6_1)
if L4_1 == 23 then
  L4_1 = string
  L4_1 = L4_1.byte
  L5_1 = L3_1
  L6_1 = 2
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 == 6 then
    goto lbl_97
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_97::
if 128 < L2_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.readprotection
L5_1 = false
L4_1(L5_1)
L4_1 = mp
L4_1 = L4_1.readfile
L5_1 = L1_1
L6_1 = L2_1 - 1
L4_1 = L4_1(L5_1, L6_1)
L5_1 = mp
L5_1 = L5_1.readprotection
L6_1 = true
L5_1(L6_1)
if L4_1 == nil then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "\a\v\001\000\002$\006\241\a\001"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if L5_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
