-- Threat: !InfrastructureShared
-- Name: 10178680f7ed9
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 7 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 5 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
