-- Threat: !InfrastructureShared
-- Name: 477871ac190a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.has_msilresources and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
