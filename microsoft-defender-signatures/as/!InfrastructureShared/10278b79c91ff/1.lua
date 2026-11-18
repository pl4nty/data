-- Threat: !InfrastructureShared
-- Name: 10278b79c91ff
-- Type: 21

if peattributes.isexe == true and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.INFECTED
