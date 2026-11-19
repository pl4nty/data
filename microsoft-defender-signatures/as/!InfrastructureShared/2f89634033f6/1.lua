-- Threat: !InfrastructureShared
-- Name: 2f89634033f6
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 15, 255)
local l_0_1 = 1
local l_0_2 = 1
while l_0_1 < #l_0_0 do
  local l_0_3 = string.byte(l_0_0, l_0_1)
  if l_0_3 == 254 then
    if string.byte(l_0_0, l_0_1 + 1) ~= 192 then
      return mp.CLEAN
    end
    l_0_2 = l_0_2 + 1
    l_0_1 = l_0_1 + 2
  elseif l_0_3 == 4 then
    l_0_2 = l_0_2 + string.byte(l_0_0, l_0_1 + 1)
    l_0_1 = l_0_1 + 2
  elseif l_0_3 == 44 then
    l_0_2 = l_0_2 - string.byte(l_0_0, l_0_1 + 1)
    l_0_1 = l_0_1 + 2
  elseif l_0_3 == 60 then
    do
      local l_0_4 = string.byte(l_0_0, l_0_1 + 1)
      if l_0_4 >= l_0_2 + 110 and l_0_4 <= l_0_2 + 112 or l_0_4 == l_0_2 then
        local l_0_5 = "\235"
        pe.mmap_patch_va(pevars.sigaddr + l_0_1 + 16, l_0_5)
        return mp.INFECTED
      end
      l_0_1 = l_0_1 + 2
    end
  elseif l_0_3 == 116 then
    l_0_1 = l_0_1 + 2
  elseif l_0_3 == 117 then
    l_0_1 = l_0_1 + (string.byte(l_0_0, l_0_1 + 1) + 2)
  else
    return mp.CLEAN
  end
end
return mp.CLEAN
