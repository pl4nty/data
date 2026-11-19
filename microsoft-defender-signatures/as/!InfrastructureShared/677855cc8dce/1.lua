-- Threat: !InfrastructureShared
-- Name: 677855cc8dce
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 13 then
  return mp.INFECTED
end
if mp.getfilesize() < 2097152 and peattributes.isdll and peattributes.x86_image and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
