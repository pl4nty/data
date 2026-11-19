-- Threat: !InfrastructureShared
-- Name: 3378d1056bc9
-- Type: 21

function byte_to_dword(l_1_0)
  local l_1_1 = 0
  
  for l_1_2 = 4, 1, -1 do
    l_1_1 = l_1_1 * 256 + string.byte(l_1_0, l_1_2)
  end
  return l_1_1
end

local l_0_0 = hstrlog[1].VA
local l_0_1 = pe.mmap_va(l_0_0 - 2, 4)
local l_0_2 = byte_to_dword(l_0_1)
if "MZ" ~= pe.mmap_va(l_0_2, 2) then
  return mp.CLEAN
end
local l_0_3 = pe.mmap_va(l_0_0 + 12, 4)
local l_0_4 = byte_to_dword(l_0_3)
if "\000\000\255\255" ~= pe.mmap_va(l_0_4, 4) then
  return mp.CLEAN
end
return mp.INFECTED
