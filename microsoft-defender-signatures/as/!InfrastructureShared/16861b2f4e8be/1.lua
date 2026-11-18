-- Threat: !InfrastructureShared
-- Name: 16861b2f4e8be
-- Type: 21

if mp.HSTR_WEIGHT >= 5 then
  return mp.INFECTED
end
if peattributes.amd64_image then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan_minipopups")
else
  mp.set_mpattribute("do_exhaustivehstr_rescan_minipopups")
end
return mp.CLEAN
