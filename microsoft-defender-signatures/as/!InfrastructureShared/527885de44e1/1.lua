-- Threat: !InfrastructureShared
-- Name: 527885de44e1
-- Type: 21

if not mp.get_mpattribute("RPF:TopLevelFile") then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.getfilename())
l_0_0 = MpCommon.PathToWin32Path(l_0_0)
local l_0_1 = MpCommon.GetMountedFileBackingFilePath(l_0_0)
if l_0_1 then
  return mp.CLEAN
end
local l_0_2 = pe.get_versioninfo()
if l_0_2 == nil then
  return mp.CLEAN
end
if l_0_2.OriginalFilename ~= "WerFaultSecure.exe" or l_0_2.InternalName ~= "WerFaultSecure" or l_0_2.FileDescription ~= "Windows Fault Reporting" then
  return mp.CLEAN
end
if not mp.get_mpattribute("PEPCODE:HasDigitalSignature") or l_0_2.CompanyName ~= "Microsoft Corporation" then
  return mp.CLEAN
end
local l_0_3 = versioning.GetOsVersion()
if l_0_3 <= 393220 then
  return mp.CLEAN
end
local l_0_4 = pe.get_fixedversioninfo()
local l_0_5 = crypto.shr64(l_0_4.FileVersion, 48)
if 10 <= l_0_5 then
  return mp.CLEAN
end
local l_0_6
l_0_6 = mp.getfilename()
if l_0_6 == nil then
  return mp.CLEAN
end
l_0_6 = MpCommon.PathToWin32Path(l_0_6)
MpCommon.SetOriginalFileName(l_0_6, "VulnWerFaultSecureExe.exe")
return mp.INFECTED
