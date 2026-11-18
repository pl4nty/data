-- Threat: !InfrastructureShared
-- Name: 11d78d7b31da4
-- Type: 21

if mp.HSTR_WEIGHT < 31 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
end
if mp.HSTR_WEIGHT >= 31 then
  return mp.INFECTED
end
return mp.LOWFI
