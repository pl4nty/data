-- Threat: !InfrastructureShared
-- Name: 1f78860e56a7
-- Type: 21

if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
