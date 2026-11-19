-- Threat: !InfrastructureShared
-- Name: 3978fc0cd704
-- Type: 21

if peattributes.isdll == true and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
