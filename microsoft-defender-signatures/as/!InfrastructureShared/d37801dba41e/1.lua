-- Threat: !InfrastructureShared
-- Name: d37801dba41e
-- Type: 21

if mp.HSTR_WEIGHT >= 7 then
  return mp.INFECTED
end
if not peattributes.isexe then
  return mp.CLEAN
end
if peattributes.amd64_image then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan_2345cn")
else
  mp.set_mpattribute("do_exhaustivehstr_rescan_2345cn")
end
return mp.CLEAN
