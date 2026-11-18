-- Threat: !InfrastructureShared
-- Name: eb78d54ca605
-- Type: 21

if mp.HSTR_WEIGHT >= 4 and pesecs[1].SizeOfRawData > 1245184 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
