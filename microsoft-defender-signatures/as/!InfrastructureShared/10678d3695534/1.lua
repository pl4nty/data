-- Threat: !InfrastructureShared
-- Name: 10678d3695534
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
