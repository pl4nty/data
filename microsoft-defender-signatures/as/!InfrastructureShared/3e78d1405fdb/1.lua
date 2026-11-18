-- Threat: !InfrastructureShared
-- Name: 3e78d1405fdb
-- Type: 21

if peattributes.isdll == true and peattributes.has_msilresources and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
