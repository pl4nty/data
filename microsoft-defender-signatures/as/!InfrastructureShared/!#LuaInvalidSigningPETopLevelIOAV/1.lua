-- Threat: !InfrastructureShared
-- Name: !#Lua:InvalidSigningPETopLevelIOAV
-- Type: 9
-- MpAttributes: RPF:PEHasIOAVURL & RPF:TopLevelFile

if mp.GetCertificateInfo(false) ~= nil and not mp.IsTrustedFile(false) then
  local l_0_0 = mp.IOAVGetDownloadBrowser()
  if l_0_0 ~= nil then
    l_0_0 = string.lower(l_0_0)
    if l_0_0 == "utorrent.exe" or l_0_0 == "bittorrent.exe" then
      mp.set_mpattribute("Lua:InvalidSigningPETopLevelIOAVuTorrent")
    else
      mp.set_mpattribute("Lua:InvalidSigningPETopLevelIOAV")
      mp.set_mpattribute("MpNonCachedLowfi")
    end
  else
    mp.set_mpattribute("Lua:InvalidSigningPETopLevelIOAV")
    mp.set_mpattribute("MpNonCachedLowfi")
  end
end
return mp.CLEAN
