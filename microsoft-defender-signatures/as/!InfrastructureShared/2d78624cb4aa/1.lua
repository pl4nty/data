-- Threat: !InfrastructureShared
-- Name: 2d78624cb4aa
-- Type: 21

if mp.getfilesize() < 5242880 then
  if peattributes.x86_image then
    if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
      mp.set_mpattribute("do_exhaustivehstr_rescan")
    end
  elseif peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
    mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
  end
end
return mp.INFECTED
