-- Threat: !InfrastructureShared
-- Name: a478acb1522c
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 5 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan`")
pe.reemulate()
return mp.CLEAN
