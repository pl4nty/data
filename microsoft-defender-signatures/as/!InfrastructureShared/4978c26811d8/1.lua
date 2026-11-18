-- Threat: !InfrastructureShared
-- Name: 4978c26811d8
-- Type: 21

if peattributes.x86_image and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
