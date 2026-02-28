local L0_1, L1_1, L2_1
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 37
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 232 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[36]
if L0_1 ~= 96 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 41
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2180287232 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[77]
if L0_1 ~= 232 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = epcode
L0_1 = L0_1[82]
if L0_1 ~= 195 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u32
L1_1 = epcode
L2_1 = 57
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 2240800907 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = epcode
L2_1 = 65
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 46591 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.readu_u16
L1_1 = epcode
L2_1 = 71
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 34191 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[1]
L2_1 = 184
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 184 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[6]
L2_1 = 184
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 184 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[11]
L2_1 = 184
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 184 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[16]
L2_1 = 184
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 184 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[21]
L2_1 = 184
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 184 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.bitand
L1_1 = epcode
L1_1 = L1_1[26]
L2_1 = 184
L0_1 = L0_1(L1_1, L2_1)
if L0_1 ~= 184 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
