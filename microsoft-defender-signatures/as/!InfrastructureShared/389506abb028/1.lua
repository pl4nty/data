-- Threat: !InfrastructureShared
-- Name: 389506abb028
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 16, 105)
local l_0_1 = string.byte(l_0_0, 1) + 2
if l_0_1 > #l_0_0 then
  return mp.CLEAN
end
if string.byte(l_0_0, l_0_1) == 232 then
  local l_0_2 = 2
  while l_0_2 < #l_0_0 do
    local l_0_3 = string.byte(l_0_0, l_0_2)
    if l_0_3 == 61 then
      l_0_2 = l_0_2 + 5
    elseif l_0_3 == 204 then
      return mp.INFECTED
    elseif l_0_3 == 116 then
      do
        local l_0_4 = string.byte(l_0_0, l_0_2 + 1)
        l_0_2 = l_0_2 + 2
        if l_0_1 ~= l_0_4 + l_0_2 then
          return mp.CLEAN
        end
      end
    else
      return mp.CLEAN
    end
  end
end
return mp.CLEAN
