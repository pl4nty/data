-- Threat: !InfrastructureShared
-- Name: 192955777dd2
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = "chrome"
if string.find(l_0_0, l_0_1, 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
