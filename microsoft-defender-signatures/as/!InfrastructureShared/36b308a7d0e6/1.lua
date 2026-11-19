-- Threat: !InfrastructureShared
-- Name: 36b308a7d0e6
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = string.sub(l_0_0, -10)
if l_0_1 then
  local l_0_2 = string.lower(l_0_1)
  if l_0_2 == "\\mshta.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
