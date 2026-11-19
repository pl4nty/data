-- Threat: !InfrastructureShared
-- Name: 10b786b7c9869
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if peattributes.isexe ~= true then
  return mp.CLEAN
end
if string.find(l_0_0, "\\vipre business agent\\sbamsvc.exe", 1, true) or string.find(l_0_0, "win10clean", 1, true) then
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
