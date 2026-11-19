-- Threat: !InfrastructureShared
-- Name: 12c78ec70513d
-- Type: 21

if mp.HSTR_WEIGHT >= 6 then
  return mp.INFECTED
end
if not peattributes.isdll then
  return mp.CLEAN
end
if peattributes.amd64_image then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan_2345cn")
else
  mp.set_mpattribute("do_exhaustivehstr_rescan_2345cn")
end
return mp.CLEAN
