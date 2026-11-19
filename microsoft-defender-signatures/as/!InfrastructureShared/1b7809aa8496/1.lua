-- Threat: !InfrastructureShared
-- Name: 1b7809aa8496
-- Type: 21

local l_0_0 = pe.get_versioninfo()
if l_0_0 and l_0_0.FileDescription and l_0_0.FileDescription == "client" then
  return mp.INFECTED
end
return mp.CLEAN
