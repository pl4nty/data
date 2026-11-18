-- Threat: !InfrastructureShared
-- Name: 3f78bb988d81
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") and mp.getfilesize() < 10485760 then
  return mp.INFECTED
end
return mp.CLEAN
