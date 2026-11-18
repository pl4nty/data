-- Threat: !InfrastructureShared
-- Name: 5561f0823edd
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 13 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 6 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
