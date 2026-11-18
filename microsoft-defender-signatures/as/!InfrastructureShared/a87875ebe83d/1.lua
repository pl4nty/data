-- Threat: !InfrastructureShared
-- Name: a87875ebe83d
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 6 then
  return mp.INFECTED
end
if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
  return mp.CLEAN
end
return mp.LOWFI
