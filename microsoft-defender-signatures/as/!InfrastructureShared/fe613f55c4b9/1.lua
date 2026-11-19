-- Threat: !InfrastructureShared
-- Name: fe613f55c4b9
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 11 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
