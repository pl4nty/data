-- Threat: !InfrastructureShared
-- Name: 9078db2a1496
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
