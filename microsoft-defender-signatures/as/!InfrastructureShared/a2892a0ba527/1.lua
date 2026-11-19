-- Threat: !InfrastructureShared
-- Name: a2892a0ba527
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr - 10, 32)
local l_0_1 = mp.readu_u32(l_0_0, 1)
if mp.readu_u32(l_0_0, 14) ~= l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.readu_u32(l_0_0, 7)
l_0_0 = pe.mmap_va(l_0_2, 4)
local l_0_3 = pe.get_api_id(mp.readu_u32(l_0_0, 1))
if l_0_3 ~= 1269389306 then
  return mp.CLEAN
end
pe.mmap_patch_va(l_0_1, "\221\a")
return mp.INFECTED
