-- Threat: !InfrastructureShared
-- Name: 5078d118da9e
-- Type: 21

function bytes_to_int(l_1_0, l_1_1, l_1_2, l_1_3)
  if not l_1_3 then
    error("need four bytes to convert to int", 2)
  end
  return l_1_0 + l_1_1 * 256 + l_1_2 * 65536 + l_1_3 * 16777216
end

function pointer2int(l_2_0, l_2_1)
  local l_2_2 = string.byte(l_2_0, l_2_1)
  local l_2_3 = string.byte(l_2_0, l_2_1 + 1)
  local l_2_4 = string.byte(l_2_0, l_2_1 + 2)
  local l_2_5 = string.byte(l_2_0, l_2_1 + 3)
  return (bytes_to_int(l_2_2, l_2_3, l_2_4, l_2_5))
end

local l_0_0 = hstrlog[1].VA
local l_0_1 = 20
local l_0_2 = pe.mmap_va(l_0_0 - l_0_1, l_0_1)
local l_0_3
for l_0_4 = 1, l_0_1 do
  local l_0_5 = string.byte(l_0_2, l_0_4)
  if l_0_5 == 138 then
    local l_0_6 = string.byte(l_0_2, l_0_4 + 5)
    if l_0_6 == 0 then
      l_0_3 = pointer2int(l_0_2, l_0_4 + 2)
      break
    end
  end
end
if l_0_3 ~= nil then
  local l_0_7 = pe.mmap_va(l_0_3, 64)
  local l_0_8 = 13
  local l_0_9 = string.byte(l_0_7, l_0_8)
  local l_0_10 = string.byte(l_0_7, l_0_8 + 2)
  local l_0_11 = string.byte(l_0_7, l_0_8 + 3)
  local l_0_12 = string.byte(l_0_7, l_0_8 + 32)
  local l_0_13 = string.byte(l_0_7, l_0_8 + 34)
  local l_0_14 = string.byte(l_0_7, l_0_8 + 35)
  local l_0_15 = mp.bitxor(l_0_9, l_0_12)
  local l_0_16 = mp.bitxor(l_0_10, l_0_13)
  local l_0_17 = mp.bitxor(l_0_11, l_0_14)
  if l_0_15 == 117 and l_0_16 == 255 and l_0_17 == 85 then
    return mp.SUSPICIOUS
  end
end
return mp.CLEAN
