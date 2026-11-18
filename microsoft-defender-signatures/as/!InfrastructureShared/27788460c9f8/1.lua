-- Threat: !InfrastructureShared
-- Name: 27788460c9f8
-- Type: 21

if peattributes.ismsil ~= true then
  return mp.CLEAN
end
if mp.get_mpattribute("PEPCODE:HasDigitalSignature") then
  return mp.CLEAN
end
local l_0_0 = pe.get_versioninfo()
if l_0_0.OriginalFilename ~= nil and l_0_0.OriginalFilename:lower() == "sync.exe" and l_0_0.InternalName ~= nil and l_0_0.InternalName:lower() == "sync.exe" and l_0_0.ProductVersion ~= nil and l_0_0.ProductVersion:lower() == "0.0.0.0" then
  return mp.INFECTED
end
return mp.CLEAN
