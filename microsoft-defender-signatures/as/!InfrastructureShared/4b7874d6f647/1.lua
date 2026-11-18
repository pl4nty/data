-- Threat: !InfrastructureShared
-- Name: 4b7874d6f647
-- Type: 21

if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
