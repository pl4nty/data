-- Threat: !InfrastructureShared
-- Name: 69788fadff6f
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
