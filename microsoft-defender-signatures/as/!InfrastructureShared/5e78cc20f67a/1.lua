-- Threat: !InfrastructureShared
-- Name: 5e78cc20f67a
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
