-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualDropExecutableFromWebmail.A
-- Type: 13
-- Includes: HIPSEmailInfrastructure
-- MpAttributes: RPF:TopLevelFile

if not mp.IsHipsRuleEnabled("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550") then
  return mp.CLEAN
end
local l_0_0 = "enghipscpy:blockaccess:be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
local l_0_1 = mp.GetScanSource()
if l_0_1 ~= mp.SCANSOURCE_IOAV_WEB then
  return mp.CLEAN
end
local l_0_2 = versioning.GetOrgID()
if versioning.IsSampled(45000, false, false, false) == true or l_0_2 ~= nil and string.lower(l_0_2) == "9014d404-b785-445d-80c9-24a55879a64c" then
  if not IsWebmailDownloadUrlIoavAndMotwV1() then
    return mp.CLEAN
  end
elseif not IsWebmailDownloadUrlIoavAndMotwV0() then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if string.len(l_0_3) < 4 then
  return mp.CLEAN
end
local l_0_4 = string.sub(l_0_3, -4):match("%.(%w+)$")
if l_0_4 == nil then
  return mp.CLEAN
end
if IsSuspiciousFileExt(l_0_4) then
  mp.set_mpattribute("MpDisableCaching")
  if not MpCommon.QueryPersistContext(mp.getfilename(), l_0_0) then
    MpCommon.AppendPersistContext(mp.getfilename(), l_0_0, 0)
  end
  mp.SetHipsRule("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550")
  return mp.BLOCKACCESS
elseif IsArchiveFileExt(l_0_4) then
  mp.set_mpattribute("MpDisableCaching")
  if mp.get_mpattribute("Lua:ZipHasEncryptedFileWithExeExtension") or mp.get_mpattribute("Lua:RarHasEncryptedFileWithExeExtension") then
    if not MpCommon.QueryPersistContext(mp.getfilename(), l_0_0) then
      MpCommon.AppendPersistContext(mp.getfilename(), l_0_0, 0)
    end
    mp.SetHipsRule("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550")
    return mp.BLOCKACCESS
  end
  MpCommon.AppendPersistContext(mp.getfilename(), "ContextualDropEncryptedArchiveByEmail", 300)
  if mp.getfilesize() > 10485760 then
    return mp.CLEAN
  end
  mp.set_mpattribute("//Lua:ContextualDropExecutableFromWebmail.B")
  mp.set_mpattribute("MpForceScanArchives")
end
return mp.CLEAN
