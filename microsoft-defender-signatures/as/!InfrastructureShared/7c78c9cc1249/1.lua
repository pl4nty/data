-- Threat: !InfrastructureShared
-- Name: 7c78c9cc1249
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
local l_0_0 = mp.getfilesize()
if peattributes.isdll and peattributes.amd64_image and mp.get_mpattribute("pea_no_security") and 1048576 < l_0_0 and l_0_0 < 2097152 and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
return mp.CLEAN
