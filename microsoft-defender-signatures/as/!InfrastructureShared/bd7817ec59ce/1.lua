-- Threat: !InfrastructureShared
-- Name: bd7817ec59ce
-- Type: 21

if mp.HSTR_WEIGHT == 13 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
end
if mp.HSTR_WEIGHT == 14 then
  return mp.INFECTED
end
return mp.CLEAN
