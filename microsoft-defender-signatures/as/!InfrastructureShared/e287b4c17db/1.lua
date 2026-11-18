-- Threat: !InfrastructureShared
-- Name: e287b4c17db
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:find(".rsa") then
  return mp.INFECTED
end
return mp.CLEAN
