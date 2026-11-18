-- Threat: !InfrastructureShared
-- Name: cc6192e50757
-- Type: 21

local l_0_0 = mp.GetUACMetadata()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.Type ~= mp.AMSI_UAC_REQUEST_TYPE_EXE then
  return mp.CLEAN
end
if string.sub(string.lower(l_0_0.Info.ApplicationName), -24) == "exesampleuacdetected.exe" or string.sub(string.lower(l_0_0.Info.CommandLine), -25) == "exesampleuacdetected.exe\"" or string.sub(string.lower(l_0_0.Info.CommandLine), -62) == "exesampleuacdetected-9f298338-4c4e-49e8-bd3b-9a3d453c9b79.exe\"" then
  return mp.INFECTED
end
return mp.CLEAN
