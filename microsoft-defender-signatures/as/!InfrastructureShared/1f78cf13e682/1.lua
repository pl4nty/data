-- Threat: !InfrastructureShared
-- Name: 1f78cf13e682
-- Type: 21

if peattributes.x86_image == true and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
