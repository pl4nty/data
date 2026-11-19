-- Threat: !InfrastructureShared
-- Name: 22784813b726
-- Type: 21

if mp.getfilesize() < 155000 then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
  pe.reemulate()
end
return mp.INFECTED
