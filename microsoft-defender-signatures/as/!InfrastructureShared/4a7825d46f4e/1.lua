-- Threat: !InfrastructureShared
-- Name: 4a7825d46f4e
-- Type: 21

if peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
return mp.INFECTED
