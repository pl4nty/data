-- Threat: !InfrastructureShared
-- Name: e87891691ad8
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
