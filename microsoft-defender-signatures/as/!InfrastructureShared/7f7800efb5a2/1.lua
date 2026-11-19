-- Threat: !InfrastructureShared
-- Name: 7f7800efb5a2
-- Type: 21

local l_0_0 = mp.getfilesize()
if 1000000 < l_0_0 or l_0_0 < 4000 then
  return mp.CLEAN
end
if peattributes.x86_image then
  if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
    mp.set_mpattribute("do_exhaustivehstr_rescan")
  end
elseif peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
return mp.INFECTED
