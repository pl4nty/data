-- Threat: !InfrastructureShared
-- Name: 2778710d5cae
-- Type: 21

if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
