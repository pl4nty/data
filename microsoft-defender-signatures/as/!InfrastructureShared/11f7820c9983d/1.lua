-- Threat: !InfrastructureShared
-- Name: 11f7820c9983d
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 5 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
