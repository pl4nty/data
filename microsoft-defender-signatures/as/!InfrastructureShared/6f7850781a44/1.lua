-- Threat: !InfrastructureShared
-- Name: 6f7850781a44
-- Type: 21

if mp.HSTR_WEIGHT >= 3 then
  return mp.INFECTED
end
if mp.HSTR_WEIGHT < 3 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
end
return mp.LOWFI
