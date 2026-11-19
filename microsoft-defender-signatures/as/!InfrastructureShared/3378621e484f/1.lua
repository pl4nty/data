-- Threat: !InfrastructureShared
-- Name: 3378621e484f
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
