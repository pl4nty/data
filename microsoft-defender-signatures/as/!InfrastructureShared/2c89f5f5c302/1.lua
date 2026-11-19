-- Threat: !InfrastructureShared
-- Name: 2c89f5f5c302
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr - 16, 37)
local l_0_1 = mp.readu_u32(l_0_0, 2)
if mp.readu_u32(l_0_0, 20) ~= l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.readu_u32(l_0_0, 13)
l_0_0 = pe.mmap_va(l_0_2, 4)
local l_0_3 = pe.get_api_id(mp.readu_u32(l_0_0, 1))
if l_0_3 ~= 2185195070 then
  return mp.CLEAN
end
pe.mmap_patch_va(l_0_1, "\221\a")
return mp.INFECTED
