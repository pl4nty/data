-- Threat: !InfrastructureShared
-- Name: 3978018b4fd6
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
