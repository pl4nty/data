-- Threat: !InfrastructureShared
-- Name: 4078d17c27c4
-- Type: 21
-- Flags: 1

if mp.getfilesize() > 3145728 then
  return mp.CLEAN
end
if peattributes.x86_image then
  if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
    mp.set_mpattribute("do_exhaustivehstr_rescan")
  end
elseif peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
if mp.HSTR_WEIGHT >= 12 then
  return mp.INFECTED
end
return mp.CLEAN
