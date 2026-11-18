-- Threat: !InfrastructureShared
-- Name: 63296016227d
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if l_0_0:find("manifest.mf") then
  return mp.INFECTED
end
return mp.CLEAN
