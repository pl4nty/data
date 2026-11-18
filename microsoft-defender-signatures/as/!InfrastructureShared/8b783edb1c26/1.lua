-- Threat: !InfrastructureShared
-- Name: 8b783edb1c26
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
