-- Threat: !InfrastructureShared
-- Name: 9178ba18771a
-- Type: 21

if mp.get_mpattribute("SIGATTR:IndigoRoseSetupFactory") then
  return mp.INFECTED
end
return mp.CLEAN
