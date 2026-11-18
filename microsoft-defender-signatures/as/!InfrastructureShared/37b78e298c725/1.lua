-- Threat: !InfrastructureShared
-- Name: 37b78e298c725
-- Type: 21

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil and (l_0_0.CompanyName ~= nil and string.find(l_0_0.CompanyName, "Microsoft CoreXT", 1, true) ~= nil or l_0_0.FileDescription ~= nil and string.find(l_0_0.FileDescription, "NMAgent", 1, true) ~= nil) then
  return mp.CLEAN
end
return mp.INFECTED
