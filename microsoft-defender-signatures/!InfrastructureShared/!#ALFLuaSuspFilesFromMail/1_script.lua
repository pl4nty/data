-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLuaSuspFilesFromMail\1_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
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
local l_0_3 = {}
l_0_3.iso = true
l_0_3.vhd = true
l_0_3.vhdx = true
l_0_3.ppkg = true
l_0_3.sppkg = true
l_0_3.img = true
local l_0_4 = {}
l_0_4.xlsx = true
l_0_4.xls = true
l_0_4.xlsm = true
l_0_4.xlsb = true
l_0_4.xltx = true
l_0_4.xltm = true
l_0_4.xlam = true
l_0_4.xla = true
l_0_4.xlt = true
l_0_4.docx = true
l_0_4.doc = true
l_0_4.docm = true
l_0_4.dotm = true
l_0_4.dotx = true
l_0_4.ppam = true
l_0_4.pptm = true
l_0_4.ppsm = true
l_0_4.potm = true
l_0_4.pptx = true
l_0_4.rtf = true
l_0_4.one = true
l_0_4[".onetoc2"] = true
local l_0_5 = {}
l_0_5.zip = true
l_0_5.rar = true
l_0_5.r00 = true
l_0_5["7z"] = true
l_0_5.arj = true
l_0_5.gz = true
l_0_5.ace = true
l_0_5.xz = true
l_0_5.cab = true
local l_0_6 = 0
if l_0_3[l_0_2] then
  l_0_6 = 1
else
  if l_0_4[l_0_2] then
    l_0_6 = 2
  else
    if l_0_5[l_0_2] then
      l_0_6 = 3
    else
      return mp.CLEAN
    end
  end
end
local l_0_7 = nil
local l_0_8 = ((mp.IOAVGetDownloadUrl)())
local l_0_9, l_0_10 = nil, nil
if (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true then
  _ = pcall(mp.GetMOTWHostUrl)
  _ = pcall(mp.GetMOTWReferrerUrl)
end
local l_0_11 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_11 == nil then
  return mp.CLEAN
end
l_0_11 = l_0_11:lower()
if IsWebmailDownloadURL(l_0_8) or IsWebmailDownloadURL(l_0_9) then
  l_0_7 = "webmail"
else
  if IsCommonFileSharingURL(l_0_8) or IsCommonFileSharingURL(l_0_9) then
    l_0_7 = "linkinemail"
  else
    if isOutlookProcess(l_0_11) then
      l_0_7 = "emailclient"
    else
      local l_0_12 = getCachePaths(l_0_11)
      if l_0_12 == nil then
        return mp.CLEAN
      end
      for l_0_16,l_0_17 in pairs(l_0_12) do
        if l_0_0:find(l_0_17, 1, true) ~= nil then
          l_0_7 = "emailclient"
          break
        end
      end
    end
  end
end
do
  if l_0_7 == nil then
    l_0_12 = mp
    l_0_12 = l_0_12.CLEAN
    return l_0_12
  end
  l_0_12 = mp
  l_0_12 = l_0_12.get_contextdata
  l_0_12 = l_0_12(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
  local l_0_18 = nil
  l_0_18 = mp
  l_0_18 = l_0_18.get_contextdata
  l_0_18 = l_0_18(mp.CONTEXT_DATA_PROCESS_PPID)
  local l_0_19 = nil
  l_0_19 = MpCommon
  l_0_19 = l_0_19.PathToWin32Path
  l_0_19 = l_0_19(l_0_12)
  l_0_12 = l_0_19
  if l_0_12 == nil or l_0_18 == nil then
    l_0_19 = mp
    l_0_19 = l_0_19.CLEAN
    return l_0_19
  end
  l_0_19 = l_0_19(l_0_12)
  l_0_12 = l_0_19
  l_0_19 = l_0_12
  l_0_19 = l_0_19 .. "\\" .. l_0_11
  local l_0_20 = nil
  l_0_20 = MpCommon
  l_0_20 = l_0_20.GetCurrentTimeT
  l_0_20 = l_0_20()
  local l_0_21 = nil
  l_0_21 = 31536000
  local l_0_22 = nil
  l_0_22 = l_0_0
  l_0_22 = l_0_22 .. "\\" .. l_0_1
  local l_0_23 = nil
  l_0_23 = mp
  l_0_23 = l_0_23.getfilesize
  l_0_23 = l_0_23()
  local l_0_24 = nil
  l_0_24 = ""
  local l_0_25 = nil
  if l_0_6 == 1 then
    l_0_25 = mp
    l_0_25 = l_0_25.set_mpattribute
    l_0_25("BM_ISOsFromEmailsMotw")
  else
    if l_0_6 == 2 then
      l_0_25 = mp
      l_0_25 = l_0_25.get_mpattribute
      l_0_25 = l_0_25("MHSTR:MacroInside")
      if l_0_25 then
        l_0_25 = l_0_24
        l_0_24 = l_0_25 .. "HasMacros|"
      end
      l_0_25 = mp
      l_0_25 = l_0_25.set_mpattribute
      l_0_25("BM_OfficeFromEmailMotw")
    else
      l_0_25 = mp
      l_0_25 = l_0_25.get_mpattribute
      l_0_25 = l_0_25("Lua:ZipEncrypted")
      if not l_0_25 then
        l_0_25 = mp
        l_0_25 = l_0_25.get_mpattribute
        l_0_25 = l_0_25("Lua:RarHasEncryptedFile")
      end
      if l_0_25 then
        l_0_24 = "isEncrypted|"
      end
      l_0_25 = mp
      l_0_25 = l_0_25.set_mpattribute
      l_0_25("BM_ArchivesFromEmailsMotw")
    end
  end
  l_0_25 = string
  l_0_25 = l_0_25.format
  local l_0_26 = nil
  l_0_26 = "WARCH::ProcessImagePath=%s;ProcessPID=%s;timestamp=%s;FileName=%s;FileSize=%s;Source=%s;OriginalArtifactPath=%s;Referrer=%s;extra=%s"
  local l_0_27 = nil
  l_0_27 = l_0_19
  local l_0_28 = nil
  l_0_28 = l_0_18
  local l_0_29 = nil
  l_0_29 = l_0_20
  local l_0_30 = nil
  l_0_30 = l_0_22
  local l_0_31 = nil
  l_0_31 = l_0_23
  local l_0_32 = nil
  l_0_32 = l_0_7
  local l_0_33 = nil
  do
    l_0_33 = l_0_8 or l_0_9
    l_0_25 = l_0_25(l_0_26, l_0_27, l_0_28, l_0_29, l_0_30, l_0_31, l_0_32, l_0_33, l_0_10, l_0_24)
    l_0_26 = IsKeyInRollingQueue
    l_0_27 = "CC_filelist"
    l_0_28 = l_0_22
    l_0_26 = l_0_26(l_0_27, l_0_28)
    if not l_0_26 then
      l_0_26 = AppendToRollingQueue
      l_0_27 = "CC_filelist"
      l_0_28 = l_0_22
      l_0_29 = l_0_25
      l_0_30 = l_0_21
      l_0_31 = 32
      l_0_26(l_0_27, l_0_28, l_0_29, l_0_30, l_0_31)
      l_0_26 = mp
      l_0_26 = l_0_26.set_mpattribute
      l_0_27 = string
      l_0_27 = l_0_27.format
      l_0_28 = "MpInternal_researchdata=CC_Research=%s"
      l_0_29 = l_0_25
      l_0_26(l_0_27(l_0_28, l_0_29))
    end
    l_0_26 = mp
    l_0_26 = l_0_26.INFECTED
    do return l_0_26 end
    -- DECOMPILER ERROR at PC330: Confused about usage of register R23 for local variables in 'ReleaseLocals'

  end
end

