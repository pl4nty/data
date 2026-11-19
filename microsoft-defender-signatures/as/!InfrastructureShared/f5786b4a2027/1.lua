-- Threat: !InfrastructureShared
-- Name: f5786b4a2027
-- Type: 21

if mp.HSTR_WEIGHT >= 2 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
return mp.CLEAN
