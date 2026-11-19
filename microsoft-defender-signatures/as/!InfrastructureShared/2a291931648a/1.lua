-- Threat: !InfrastructureShared
-- Name: 2a291931648a
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = "/package.json"
if string.find(l_0_0, l_0_1, -1 * #l_0_1, true) then
  return mp.INFECTED
end
return mp.CLEAN
