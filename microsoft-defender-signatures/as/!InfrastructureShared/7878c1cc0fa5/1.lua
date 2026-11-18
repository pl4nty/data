-- Threat: !InfrastructureShared
-- Name: 7878c1cc0fa5
-- Type: 21

function getu32(l_1_0, l_1_1)
  local l_1_2, l_1_3, l_1_4, l_1_5
  
  l_1_2 = string.byte(l_1_0, l_1_1)
  l_1_3 = string.byte(l_1_0, l_1_1 + 1)
  l_1_4 = string.byte(l_1_0, l_1_1 + 2)
  l_1_5 = string.byte(l_1_0, l_1_1 + 3)
  return l_1_2 + l_1_3 * 256 + l_1_4 * 65536 + l_1_5 * 1048576
end

local l_0_0
if hstrlog[1].matched then
  l_0_0 = hstrlog[1].VA - 1280
elseif hstrlog[2].matched then
  l_0_0 = hstrlog[2].VA - 1360
elseif hstrlog[3].matched then
  l_0_0 = hstrlog[3].VA - 1744
elseif hstrlog[4].matched then
  l_0_0 = hstrlog[4].VA - 1280
elseif hstrlog[5].matched then
  l_0_0 = hstrlog[5].VA - 944
else
  return mp.CLEAN
end
local l_0_1 = pe.mmap_va(l_0_0, 16)
if #l_0_1 ~= 16 then
  return mp.CLEAN
end
if getu32(l_0_1, 1) ~= 0 or getu32(l_0_1, 5) == 0 or getu32(l_0_1, 9) ~= 0 or getu32(l_0_1, 13) == 0 or getu32(l_0_1, 5) ~= getu32(l_0_1, 13) then
  return mp.CLEAN
end
return mp.SUSPICIOUS
