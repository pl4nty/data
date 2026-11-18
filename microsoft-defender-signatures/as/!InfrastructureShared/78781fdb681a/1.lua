-- Threat: !InfrastructureShared
-- Name: 78781fdb681a
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
