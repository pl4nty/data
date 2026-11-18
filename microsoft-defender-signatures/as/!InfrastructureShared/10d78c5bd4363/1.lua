-- Threat: !InfrastructureShared
-- Name: 10d78c5bd4363
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan_sistakasti")
return mp.CLEAN
