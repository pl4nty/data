-- Threat: !InfrastructureShared
-- Name: 1695f4fd69ed
-- Type: 21

local l_0_0 = 13
local l_0_1 = pe.mmap_va(pevars.sigaddr + l_0_0, 96)
local l_0_2 = string.byte(l_0_1, 2) + 1
if l_0_2 > #l_0_1 then
  return mp.CLEAN
end
if string.byte(l_0_1, l_0_2) ~= 116 then
  return mp.CLEAN
end
local l_0_3 = string.byte(l_0_1, l_0_2 + 1) + 2 + l_0_2
if l_0_3 > #l_0_1 then
  return mp.CLEAN
end
if string.byte(l_0_1, l_0_3) ~= 232 then
  return mp.CLEAN
end
local l_0_4 = l_0_2 + 2
local l_0_5 = 0
local l_0_6 = false
while l_0_4 < #l_0_1 do
  local l_0_7 = string.byte(l_0_1, l_0_4)
  local l_0_8 = false
  if l_0_7 == 131 and string.byte(l_0_1, l_0_4 + 1) == 248 then
    l_0_4 = l_0_4 + 3
  elseif l_0_7 == 61 then
    l_0_4 = l_0_4 + 5
  elseif l_0_7 == 195 then
    l_0_8 = true
    l_0_4 = l_0_4 + 1
  elseif l_0_7 == 0 then
    l_0_8 = true
    l_0_4 = l_0_4 + 2
  elseif l_0_7 == 15 and string.byte(l_0_1, l_0_4 + 1) == 132 then
    l_0_4 = l_0_4 + 6
  elseif l_0_7 == 116 then
    local l_0_9 = string.byte(l_0_1, l_0_4 + 1)
    l_0_4 = l_0_4 + 2
    if l_0_3 ~= l_0_9 + l_0_4 then
      l_0_5 = l_0_5 + 1
    end
    if l_0_5 == 2 then
      return mp.CLEAN
    end
  elseif l_0_7 == 204 then
    local l_0_10 = string.format("\235%s", string.char(l_0_3 - 3))
    pe.mmap_patch_va(pevars.sigaddr + l_0_0, l_0_10)
    return mp.LOWFI
  else
    return mp.CLEAN
  end
  if l_0_6 == true and l_0_8 == false then
    return mp.CLEAN
  end
end
return mp.CLEAN
