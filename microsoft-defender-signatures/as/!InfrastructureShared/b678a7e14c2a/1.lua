-- Threat: !InfrastructureShared
-- Name: b678a7e14c2a
-- Type: 21

if mp.HSTR_WEIGHT >= 11 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
pe.reemulate()
return mp.CLEAN
