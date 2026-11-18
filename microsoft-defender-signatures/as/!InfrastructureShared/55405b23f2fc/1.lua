-- Threat: !InfrastructureShared
-- Name: 55405b23f2fc
-- Type: 21

local l_0_0 = pe.get_versioninfo()
if l_0_0.CompanyName == "Microsoft Corporation" then
  return mp.CLEAN
end
return mp.INFECTED
