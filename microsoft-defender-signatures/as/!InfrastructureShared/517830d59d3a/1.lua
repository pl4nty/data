-- Threat: !InfrastructureShared
-- Name: 517830d59d3a
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
mp.set_mpattribute("LUA:Win32/Rugmi.HBC2!MTB")
if not (mp.get_mpattribute("LUA:PEAnomaly_CertificateExpired") and mp.get_mpattribute("MpTrustCheck_HasInvalidSignature")) or not mp.get_mpattribute("MpTrustCheck_InvalidlySigned") then
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
