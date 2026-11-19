-- Threat: !InfrastructureShared
-- Name: 6f78eb90c347
-- Type: 21

local l_0_0 = hstrlog[2].VA + 45
local l_0_1 = pe.mmap_va(l_0_0, 4)
local l_0_2 = mp.readu_u32(l_0_1, 1)
local l_0_3 = pe.mmap_va(l_0_2, 16)
if string.sub(l_0_3, 1, 8) == "IExplore" then
  return mp.INFECTED
end
return mp.CLEAN
