-- Threat: !InfrastructureShared
-- Name: 6d78b0d1d7b8
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  return mp.INFECTED
elseif mp.HSTR_WEIGHT >= 1 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
