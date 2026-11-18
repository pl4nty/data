-- Threat: !InfrastructureShared
-- Name: 91782e242d9a
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
