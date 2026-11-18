-- Threat: !InfrastructureShared
-- Name: 4978dfdb50e4
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
