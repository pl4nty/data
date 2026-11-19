-- Threat: !InfrastructureShared
-- Name: 537806860ecb
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 7 then
  return mp.INFECTED
end
if mp.getfilesize() < 1048576 and peattributes.x86_image and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
