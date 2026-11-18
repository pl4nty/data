-- Threat: !InfrastructureShared
-- Name: 2529154099ab
-- Type: 21

local l_0_0 = mp.getfilesize()
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1:gsub("%+%$", "")
if 20 < l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
