-- Threat: !InfrastructureShared
-- Name: 2861d97254c9
-- Type: 21

if peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
return mp.INFECTED
