-- Threat: !InfrastructureShared
-- Name: 3189dcc61ae5
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr, 64)
local l_0_1 = mp.readu_u32(l_0_0, 6)
if l_0_1 == 4294967295 then
  return mp.CLEAN
end
local l_0_2 = mp.readu_u32(l_0_0, 22)
if l_0_1 ~= l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.readu_u32(l_0_0, 30)
if l_0_1 ~= l_0_3 then
  return mp.CLEAN
end
local l_0_4 = mp.bitand(mp.readu_u16(l_0_0, 28), 255)
if l_0_4 < 112 then
  pe.mmap_patch_va(pevars.sigaddr + 27, "\127")
  return mp.LOWFI
end
return mp.CLEAN
