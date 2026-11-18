-- Threat: !InfrastructureShared
-- Name: df78df6ca55d
-- Type: 21

local l_0_0
if hstrlog[3].matched then
  l_0_0 = hstrlog[3].VA - 4
elseif hstrlog[4].matched then
  l_0_0 = hstrlog[4].VA - 4
else
  return mp.CLEAN
end
local l_0_1 = mp.readu_u32(pe.mmap_va(l_0_0, 4), 1)
if 24576 <= l_0_1 and l_0_1 < 28672 then
  return mp.INFECTED
end
return mp.CLEAN
