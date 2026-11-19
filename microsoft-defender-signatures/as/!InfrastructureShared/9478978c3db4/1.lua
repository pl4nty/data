-- Threat: !InfrastructureShared
-- Name: 9478978c3db4
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 14 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 11 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
