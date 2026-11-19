-- Threat: !InfrastructureShared
-- Name: 2b95a86a7f59
-- Type: 21

local l_0_0 = pe.mmap_va(pevars.sigaddr + 10, 96)
local l_0_1 = 1
local l_0_2 = 120
while l_0_1 < #l_0_0 do
  local l_0_3 = string.byte(l_0_0, l_0_1)
  if l_0_3 == 254 then
    if string.byte(l_0_0, l_0_1 + 1) ~= 192 then
      return mp.CLEAN
    end
    l_0_1 = l_0_1 + 2
    l_0_2 = l_0_2 + 1
  elseif l_0_3 == 60 then
    do
      if string.byte(l_0_0, l_0_1 + 1) ~= l_0_2 then
        return mp.CLEAN
      end
      local l_0_4 = "\235"
      pe.mmap_patch_va(pevars.sigaddr + l_0_1 + 11, l_0_4)
      return mp.INFECTED
    end
  else
    return mp.CLEAN
  end
end
return mp.CLEAN
