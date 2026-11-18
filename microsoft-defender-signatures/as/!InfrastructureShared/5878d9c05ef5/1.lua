-- Threat: !InfrastructureShared
-- Name: 5878d9c05ef5
-- Type: 21

if not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
return mp.INFECTED
