-- Threat: !InfrastructureShared
-- Name: 247870927464
-- Type: 21

if peattributes.ismsil == true and peattributes.has_msilresources and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
