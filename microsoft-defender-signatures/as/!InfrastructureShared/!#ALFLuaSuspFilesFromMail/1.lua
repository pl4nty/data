-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:SuspFilesFromMail
-- Type: 13
-- Includes: GetEmailPaths, LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & MpOnCloseNewlyCreatedHintRtpScan & !BM_UNKNOWN_FILE & !pea_isexe

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 <= 4 then
  return mp.CLEAN
end
if l_0_1:find("outlookaddin", 1, true) and (l_0_0:find("msip\\logs\\", 1, true) or l_0_0:find("logs\\debug\\archive\\", 1, true)) then
  return mp.CLEAN
end
local l_0_2 = l_0_1:match("%.([^%.]+)$")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = {
  iso = true,
  vhd = true,
  vhdx = true,
  ppkg = true,
  sppkg = true,
  img = true
}
local l_0_4 = {
  xlsx = true,
  xls = true,
  xlsm = true,
  xlsb = true,
  xltx = true,
  xltm = true,
  xlam = true,
  xla = true,
  xlt = true,
  docx = true,
  doc = true,
  docm = true,
  dotm = true,
  dotx = true,
  ppam = true,
  pptm = true,
  ppsm = true,
  potm = true,
  pptx = true,
  rtf = true,
  one = true,
  [".onetoc2"] = true
}
local l_0_5 = {
  zip = true,
  rar = true,
  r00 = true,
  ["7z"] = true,
  arj = true,
  gz = true,
  ace = true,
  xz = true,
  cab = true
}
local l_0_6 = 0
if l_0_3[l_0_2] then
  l_0_6 = 1
elseif l_0_4[l_0_2] then
  l_0_6 = 2
elseif l_0_5[l_0_2] then
  l_0_6 = 3
else
  return mp.CLEAN
end
local l_0_7
local l_0_8 = mp.IOAVGetDownloadUrl()
local l_0_9, l_0_10
if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true then
  _, l_0_9 = pcall(mp.GetMOTWHostUrl)
  _, l_0_10 = pcall(mp.GetMOTWReferrerUrl)
end
local l_0_11 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_11 == nil then
  return mp.CLEAN
end
l_0_11 = l_0_11:lower()
if IsWebmailDownloadURL(l_0_8) or IsWebmailDownloadURL(l_0_9) then
  l_0_7 = "webmail"
elseif IsCommonFileSharingURL(l_0_8) or IsCommonFileSharingURL(l_0_9) then
  l_0_7 = "linkinemail"
elseif isOutlookProcess(l_0_11) then
  l_0_7 = "emailclient"
else
  local l_0_12 = getCachePaths(l_0_11)
  if l_0_12 == nil then
    return mp.CLEAN
  end
  for l_0_13, l_0_14 in pairs(l_0_12) do
    if l_0_0:find(l_0_14, 1, true) ~= nil then
      l_0_7 = "emailclient"
      break
    end
  end
end
if l_0_7 == nil then
  return mp.CLEAN
end
local l_0_15 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
local l_0_16 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
l_0_15 = MpCommon.PathToWin32Path(l_0_15)
if l_0_15 == nil or l_0_16 == nil then
  return mp.CLEAN
end
l_0_15 = l_0_15:lower()
local l_0_17 = l_0_15 .. "\\" .. l_0_11
local l_0_18 = MpCommon.GetCurrentTimeT()
local l_0_19 = 31536000
local l_0_20 = l_0_0 .. "\\" .. l_0_1
local l_0_21 = mp.getfilesize()
local l_0_22 = ""
if l_0_6 == 1 then
  mp.set_mpattribute("BM_ISOsFromEmailsMotw")
elseif l_0_6 == 2 then
  if mp.get_mpattribute("MHSTR:MacroInside") then
    l_0_22 = l_0_22 .. "HasMacros|"
  end
  mp.set_mpattribute("BM_OfficeFromEmailMotw")
else
  if mp.get_mpattribute("Lua:ZipEncrypted") or mp.get_mpattribute("Lua:RarHasEncryptedFile") then
    l_0_22 = "isEncrypted|"
  end
  mp.set_mpattribute("BM_ArchivesFromEmailsMotw")
end
local l_0_23 = string.format("WARCH::ProcessImagePath=%s;ProcessPID=%s;timestamp=%s;FileName=%s;FileSize=%s;Source=%s;OriginalArtifactPath=%s;Referrer=%s;extra=%s", l_0_17, l_0_16, l_0_18, l_0_20, l_0_21, l_0_7, l_0_8 or l_0_9, l_0_10, l_0_22)
if not IsKeyInRollingQueue("CC_filelist", l_0_20) then
  AppendToRollingQueue("CC_filelist", l_0_20, l_0_23, l_0_19, 32)
  mp.set_mpattribute(string.format("MpInternal_researchdata=CC_Research=%s", l_0_23))
end
return mp.INFECTED
