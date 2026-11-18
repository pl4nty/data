-- Threat: !InfrastructureShared
-- Name: 19c7832dd8949
-- Type: 21

if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
end
return mp.INFECTED
