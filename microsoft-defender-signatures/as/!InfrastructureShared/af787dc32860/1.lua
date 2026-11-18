-- Threat: !InfrastructureShared
-- Name: af787dc32860
-- Type: 21

if mp.HSTR_WEIGHT >= 12 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
