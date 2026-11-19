-- Threat: !InfrastructureShared
-- Name: 8778857943d7
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 5 then
  return mp.INFECTED
end
if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
  return mp.CLEAN
end
return mp.LOWFI
