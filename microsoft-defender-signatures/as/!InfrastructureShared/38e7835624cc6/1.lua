-- Threat: !InfrastructureShared
-- Name: 38e7835624cc6
-- Type: 21

if mp.HSTR_WEIGHT >= 8 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
