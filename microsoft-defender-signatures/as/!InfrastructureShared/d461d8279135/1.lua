-- Threat: !InfrastructureShared
-- Name: d461d8279135
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
