-- Threat: !InfrastructureShared
-- Name: 5d95b6b41401
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 14, 96)
local l_0_1 = string.byte(l_0_0, 1) + 2
if l_0_1 > #l_0_0 then
  return mp.CLEAN
end
if string.byte(l_0_0, l_0_1) == 232 then
  local l_0_2 = 2
  local l_0_3 = 0
  while l_0_2 < #l_0_0 do
    local l_0_4 = string.byte(l_0_0, l_0_2)
    if l_0_4 == 131 then
      l_0_2 = l_0_2 + 3
    elseif l_0_4 == 61 then
      l_0_2 = l_0_2 + 5
    elseif l_0_4 == 195 then
      l_0_2 = l_0_2 + 1
    elseif l_0_4 == 0 then
      l_0_2 = l_0_2 + 2
    elseif l_0_4 == 15 and string.byte(l_0_0, l_0_2 + 1) == 132 then
      l_0_2 = l_0_2 + 6
    elseif l_0_4 == 204 then
      return mp.INFECTED
    elseif l_0_4 == 116 then
      do
        local l_0_5 = string.byte(l_0_0, l_0_2 + 1)
        l_0_2 = l_0_2 + 2
        if l_0_1 ~= l_0_5 + l_0_2 then
          l_0_3 = l_0_3 + 1
        end
        if l_0_3 == 2 then
          return mp.CLEAN
        end
      end
    else
      return mp.CLEAN
    end
  end
end
return mp.CLEAN
