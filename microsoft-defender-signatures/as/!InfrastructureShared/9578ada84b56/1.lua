-- Threat: !InfrastructureShared
-- Name: 9578ada84b56
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
elseif mp.HSTR_WEIGHT >= 2 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  return mp.LOWFI
end
return mp.CLEAN
