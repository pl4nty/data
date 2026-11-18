-- Threat: !InfrastructureShared
-- Name: c461cf7d2b87
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 11 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
