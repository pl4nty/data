-- Threat: !InfrastructureShared
-- Name: b778e7d98d37
-- Type: 21

if mp.HSTR_WEIGHT == 4 then
  return mp.INFECTED
end
mp.set_mpattribute("do_exhaustivehstr_rescan")
pe.reemulate()
return mp.LOWFI
