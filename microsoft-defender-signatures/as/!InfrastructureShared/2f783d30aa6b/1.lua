-- Threat: !InfrastructureShared
-- Name: 2f783d30aa6b
-- Type: 21

if (peattributes.isdll == true or peattributes.isexe) and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
