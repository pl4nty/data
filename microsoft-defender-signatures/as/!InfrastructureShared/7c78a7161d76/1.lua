-- Threat: !InfrastructureShared
-- Name: 7c78a7161d76
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 5000000 then
  if peattributes.x86_image then
    if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
      mp.set_mpattribute("do_exhaustivehstr_rescan")
    end
  elseif peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
    mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
  end
end
return mp.INFECTED
