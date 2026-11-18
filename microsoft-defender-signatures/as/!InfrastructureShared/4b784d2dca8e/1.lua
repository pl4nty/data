-- Threat: !InfrastructureShared
-- Name: 4b784d2dca8e
-- Type: 21

if mp.getfilesize() < 10485760 then
  if peattributes.x86_image then
    if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
      mp.set_mpattribute("do_exhaustivehstr_rescan")
    end
  elseif peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
    mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
  end
end
return mp.INFECTED
