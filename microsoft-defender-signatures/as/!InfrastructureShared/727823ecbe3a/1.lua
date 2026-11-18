-- Threat: !InfrastructureShared
-- Name: 727823ecbe3a
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 4 then
  return mp.INFECTED
end
local l_0_0 = mp.getfilesize()
if peattributes.isdll and peattributes.amd64_image and mp.get_mpattribute("pea_no_security") and 5242880 < l_0_0 and l_0_0 < 7340032 and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
return mp.CLEAN
