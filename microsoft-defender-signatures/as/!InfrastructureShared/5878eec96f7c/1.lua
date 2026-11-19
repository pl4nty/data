-- Threat: !InfrastructureShared
-- Name: 5878eec96f7c
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 2 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 1 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
