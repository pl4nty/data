-- Threat: !InfrastructureShared
-- Name: 153789baeaa0e
-- Type: 21
-- Flags: 1

if mp.HSTR_WEIGHT >= 7 then
  return mp.INFECTED
end
if mp.getfilesize() < 1048576 then
  if peattributes.x86_image then
    if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
      mp.set_mpattribute("do_exhaustivehstr_rescan")
    end
  elseif peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
    mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
  end
end
return mp.CLEAN
