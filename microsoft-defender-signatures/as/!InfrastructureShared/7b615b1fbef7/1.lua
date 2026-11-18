-- Threat: !InfrastructureShared
-- Name: 7b615b1fbef7
-- Type: 21

if mp.get_mpattribute("CERT:PUA:Win32/FusionCore.AB") then
  return mp.INFECTED
end
return mp.CLEAN
