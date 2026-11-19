-- Threat: !InfrastructureShared
-- Name: 3678acc192f8
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
