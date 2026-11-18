-- Threat: !InfrastructureShared
-- Name: 6d78048aaedb
-- Type: 21

local l_0_0 = hstrlog[3].VA + 42
local l_0_1 = pe.mmap_va(l_0_0, 4)
if string.byte(l_0_1, 1) == 69 then
  l_0_0 = l_0_0 + 5
elseif string.byte(l_0_1, 1) == 133 then
  l_0_0 = l_0_0 + 8
else
  return mp.CLEAN
end
l_0_1 = pe.mmap_va(l_0_0, 4)
local l_0_2 = mp.readu_u32(l_0_1, 1)
local l_0_3 = pe.mmap_va(l_0_2, 16)
if string.sub(l_0_3, 1, 7) == "dfghjkl" then
  return mp.INFECTED
end
if string.sub(l_0_3, 1, 14) == "dfertter2342zc" then
  return mp.INFECTED
end
return mp.CLEAN
