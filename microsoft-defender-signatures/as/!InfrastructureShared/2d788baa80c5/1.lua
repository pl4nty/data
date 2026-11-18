-- Threat: !InfrastructureShared
-- Name: 2d788baa80c5
-- Type: 21

if peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
