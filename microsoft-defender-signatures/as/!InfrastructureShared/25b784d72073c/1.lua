-- Threat: !InfrastructureShared
-- Name: 25b784d72073c
-- Type: 21

if mp.getfilesize() < 240000 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
end
return mp.INFECTED
