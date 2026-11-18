-- Threat: !InfrastructureShared
-- Name: b5783ee05e91
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 6 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 4 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
