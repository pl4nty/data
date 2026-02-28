local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L2_1 = L0_1
L1_1 = L0_1.len
L1_1 = L1_1(L2_1)
if L1_1 < 35 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L1_1 < 177 or 2048 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.sub
L3_1 = L0_1
L4_1 = -3
L2_1 = L2_1(L3_1, L4_1)
if ".ct" ~= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L3_1 = L0_1
L2_1 = L0_1.find
L4_1 = "[\\]"
L2_1 = L2_1(L3_1, L4_1)
if nil ~= L2_1 then
  L3_1 = L0_1
  L2_1 = L0_1.match
  L4_1 = "([^\\]+)$"
  L2_1 = L2_1(L3_1, L4_1)
  L0_1 = L2_1
end
L3_1 = L0_1
L2_1 = L0_1.len
L2_1 = L2_1(L3_1)
if 35 ~= L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.crc32
L3_1 = 0
L4_1 = headerpage
L5_1 = 2
L6_1 = 16
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if 3649324682 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.crc32
L3_1 = 0
L4_1 = headerpage
L5_1 = 2
L6_1 = 16
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1)
if 2453981930 == L2_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L2_1 = L2_1()
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "\\049e7fb749be2cdf169e28bb0a27254f\\7d0b14cec8baf661c8a240560c5b7c32.ct"
L3_1 = L3_1(L4_1, L5_1)
if nil ~= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "\\049e7fb749be2cdf169e28bb0a27254f\\74338f611481d85755401412c5513fb5.ct"
L3_1 = L3_1(L4_1, L5_1)
if nil ~= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L4_1 = L2_1
L3_1 = L2_1.find
L5_1 = "\\049e7fb749be2cdf169e28bb0a27254f\\181084e525a65ef540c63d60ce07f836.ct"
L3_1 = L3_1(L4_1, L5_1)
if nil ~= L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.set_mpattribute
L4_1 = "Lua:Sefnit_Config_CT"
L3_1(L4_1)
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
