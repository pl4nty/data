-- Threat: !InfrastructureShared
-- Name: 6a78f836c88a
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 21 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
