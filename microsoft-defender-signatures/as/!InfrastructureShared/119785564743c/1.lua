-- Threat: !InfrastructureShared
-- Name: 119785564743c
-- Type: 21

if peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
return mp.INFECTED
