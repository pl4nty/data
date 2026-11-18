-- Threat: !InfrastructureShared
-- Name: 2f78f983fb22
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
