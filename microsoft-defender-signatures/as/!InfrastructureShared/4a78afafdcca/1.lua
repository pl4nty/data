-- Threat: !InfrastructureShared
-- Name: 4a78afafdcca
-- Type: 21

if peattributes.amd64_image and peattributes.isexe == true and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
return mp.INFECTED
