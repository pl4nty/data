-- Threat: !InfrastructureShared
-- Name: 10b788c351515
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 5 then
  return mp.INFECTED
end
if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
end
return mp.CLEAN
