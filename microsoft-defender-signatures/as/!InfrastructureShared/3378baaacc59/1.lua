-- Threat: !InfrastructureShared
-- Name: 3378baaacc59
-- Type: 21

if not peattributes.isdll then
  return mp.CLEAN
end
if not peattributes.no_security then
  return mp.CLEAN
end
if mp.getfilesize() > 157286400 then
  return mp.CLEAN
end
local l_0_0 = mp.GetCertificateInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
if peattributes.x86_image then
  if not mp.get_mpattribute("do_exhaustivehstr_rescan") then
    mp.set_mpattribute("do_exhaustivehstr_rescan")
  end
elseif peattributes.amd64_image and not mp.get_mpattribute("do_exhaustivehstr_64bit_rescan") then
  mp.set_mpattribute("do_exhaustivehstr_64bit_rescan")
end
return mp.INFECTED
