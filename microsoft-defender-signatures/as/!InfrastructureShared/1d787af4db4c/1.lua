-- Threat: !InfrastructureShared
-- Name: 1d787af4db4c
-- Type: 21

if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
if peattributes.amd64_image and mp.getfilesize() > 20000000 then
  return mp.INFECTED
end
return mp.CLEAN
