-- Threat: !InfrastructureShared
-- Name: 3678eb9dab2f
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
