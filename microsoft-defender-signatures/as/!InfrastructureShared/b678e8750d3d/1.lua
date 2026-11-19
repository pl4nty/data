-- Threat: !InfrastructureShared
-- Name: b678e8750d3d
-- Type: 21

if mp.HSTR_WEIGHT >= 11 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
