-- Threat: !InfrastructureShared
-- Name: 9f7864186718
-- Type: 21

if mp.HSTR_WEIGHT < 11 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
end
if mp.HSTR_WEIGHT == 11 then
  return mp.INFECTED
end
return mp.LOWFI
