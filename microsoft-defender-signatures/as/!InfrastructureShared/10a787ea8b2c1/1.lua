-- Threat: !InfrastructureShared
-- Name: 10a787ea8b2c1
-- Type: 21

if mp.HSTR_WEIGHT >= 8 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
