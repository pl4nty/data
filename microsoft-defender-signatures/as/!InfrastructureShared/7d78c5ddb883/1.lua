-- Threat: !InfrastructureShared
-- Name: 7d78c5ddb883
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
