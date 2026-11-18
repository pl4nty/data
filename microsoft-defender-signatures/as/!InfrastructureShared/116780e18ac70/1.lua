-- Threat: !InfrastructureShared
-- Name: 116780e18ac70
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
