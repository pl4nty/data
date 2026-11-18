-- Threat: !InfrastructureShared
-- Name: 42619d6a64f4
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 20 then
  return mp.INFECTED
end
if mp.getfilesize() < 7340032 and peattributes.isdll and peattributes.x86_image and not mp.get_mpattribute("do_exhaustivehstr_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_rescan")
end
return mp.CLEAN
