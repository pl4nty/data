-- Threat: !InfrastructureShared
-- Name: 51789ca645a4
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("SIGATTR:Trojan:MSIL/Remcos") then
  return mp.INFECTED
end
return mp.CLEAN
