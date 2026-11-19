-- Threat: !InfrastructureShared
-- Name: 2f878719c5e1a
-- Type: 21

if mp.HSTR_WEIGHT >= 9 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan_onescan")
return mp.CLEAN
