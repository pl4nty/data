-- Threat: !InfrastructureShared
-- Name: 734170bd7092
-- Type: 21

local l_0_0 = nri.GetURI()
local l_0_1 = l_0_0:match("?auth_signature=([a-f0-9]+)")
if l_0_1 ~= nil and #l_0_1 == 32 then
  return mp.INFECTED
end
return mp.CLEAN
