-- Threat: !InfrastructureShared
-- Name: 2a8783fe7e9e5
-- Type: 21

if mp.getfilesize() < 197000 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
end
return mp.INFECTED
