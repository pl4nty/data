-- Threat: !InfrastructureShared
-- Name: 1a29a5ec31ac
-- Type: 21

local l_0_0 = mp.getfilename()
local l_0_1 = "/tmp"
if l_0_0:find(l_0_1, 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
