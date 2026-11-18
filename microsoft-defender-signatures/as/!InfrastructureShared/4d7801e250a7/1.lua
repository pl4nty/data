-- Threat: !InfrastructureShared
-- Name: 4d7801e250a7
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 307200 <= l_0_0 and l_0_0 <= 512000 then
  return mp.INFECTED
end
return mp.CLEAN
