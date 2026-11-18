-- Threat: !InfrastructureShared
-- Name: 3a7814955c6c
-- Type: 21

local l_0_0 = hstrlog[1].VA
local l_0_1 = pe.mmap_va(l_0_0 + 30, 4)
local l_0_2 = 0
for l_0_3 = 4, 1, -1 do
  l_0_2 = l_0_2 * 256 + string.byte(l_0_1, l_0_3)
end
local l_0_4 = hstrlog[2].VA
if l_0_2 + 6 + 30 + l_0_0 ~= l_0_4 then
  return mp.LOWFI
end
return mp.CLEAN
