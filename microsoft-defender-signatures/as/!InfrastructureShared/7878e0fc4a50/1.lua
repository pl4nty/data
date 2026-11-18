-- Threat: !InfrastructureShared
-- Name: 7878e0fc4a50
-- Type: 21

if mp.HSTR_WEIGHT >= 11 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
