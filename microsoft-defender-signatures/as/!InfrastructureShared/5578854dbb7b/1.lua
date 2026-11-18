-- Threat: !InfrastructureShared
-- Name: 5578854dbb7b
-- Type: 21

if mp.HSTR_WEIGHT > 6 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT > 5 then
  return mp.SUSPICIOUS
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
pe.reemulate()
return mp.CLEAN
