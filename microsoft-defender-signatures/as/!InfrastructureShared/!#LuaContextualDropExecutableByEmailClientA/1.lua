local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.GetScanSource
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.SCANSOURCE_IOAV_WEB
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANSOURCE_IOAV_FILE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.SCANSOURCE_RTP
    if L0_1 ~= L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
  end
end
L1_1 = mp
L1_1 = L1_1.IsHipsRuleEnabled
L2_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L1_1 = L1_1(L2_1)
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = MpCommon
L2_1 = L2_1.PathToWin32Path
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = mp
L2_1 = L2_1.IsPathExcludedForHipsRule
L3_1 = L1_1
L4_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = "enghipscpy:blockaccess:be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
L3_1 = MpCommon
L3_1 = L3_1.QueryPersistContext
L4_1 = L1_1
L5_1 = L2_1
L3_1 = L3_1(L4_1, L5_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.set_mpattribute
  L4_1 = "MpDisableCaching"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.SetHipsRule
  L4_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.BLOCKACCESS
  return L3_1
end
L3_1 = nil
L4_1 = IsWebmailDownloadUrlIoavAndMotwV0
L4_1 = L4_1()
if L4_1 ~= true then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L1_1
  L6_1 = "\\inetcache\\content.outlook\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if L4_1 == nil then
    L4_1 = string
    L4_1 = L4_1.find
    L5_1 = L1_1
    L6_1 = "\\temporary internet files\\content.outlook\\"
    L7_1 = 1
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == nil then
      L4_1 = mp
      L4_1 = L4_1.get_contextdata
      L5_1 = mp
      L5_1 = L5_1.CONTEXT_DATA_SCANREASON
      L4_1 = L4_1(L5_1)
      L5_1 = mp
      L5_1 = L5_1.SCANREASON_ONMODIFIEDHANDLECLOSE
      if L4_1 ~= L5_1 then
        goto lbl_169
      end
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = mp
      L5_1 = L5_1.get_contextdata
      L6_1 = mp
      L6_1 = L6_1.CONTEXT_DATA_PROCESSNAME
      L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1)
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
      if L4_1 ~= "outlook.exe" then
        L4_1 = string
        L4_1 = L4_1.lower
        L5_1 = mp
        L5_1 = L5_1.get_contextdata
        L6_1 = mp
        L6_1 = L6_1.CONTEXT_DATA_PROCESSNAME
        L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1)
        L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
        if L4_1 ~= "olk.exe" then
          goto lbl_169
        end
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.getfilename
L5_1 = mp
L5_1 = L5_1.bitor
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_FNAME
L7_1 = mp
L7_1 = L7_1.FILEPATH_QUERY_LOWERCASE
L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1, L7_1)
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
if L4_1 ~= nil then
  L5_1 = string
  L5_1 = L5_1.len
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if not (L5_1 < 4) then
    goto lbl_155
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
do return L5_1 end
::lbl_155::
L5_1 = string
L5_1 = L5_1.match
L6_1 = L4_1
L7_1 = "%.(%w+)$"
L5_1 = L5_1(L6_1, L7_1)
L3_1 = L5_1
if L3_1 == nil or L3_1 == "" then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  do return L5_1 end
  goto lbl_272
  ::lbl_169::
  L4_1 = mp
  L4_1 = L4_1.get_contextdata
  L5_1 = mp
  L5_1 = L5_1.CONTEXT_DATA_SCANREASON
  L4_1 = L4_1(L5_1)
  L5_1 = mp
  L5_1 = L5_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L4_1 == L5_1 then
    L4_1 = string
    L4_1 = L4_1.lower
    L5_1 = mp
    L5_1 = L5_1.get_contextdata
    L6_1 = mp
    L6_1 = L6_1.CONTEXT_DATA_PROCESSNAME
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1)
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
    if L4_1 == "msedgewebview2.exe" then
      L4_1 = mp
      L4_1 = L4_1.get_contextdata
      L5_1 = mp
      L5_1 = L5_1.CONTEXT_DATA_PROCESS_PPID
      L4_1 = L4_1(L5_1)
      L5_1 = string
      L5_1 = L5_1.lower
      L6_1 = mp
      L6_1 = L6_1.GetProcessCommandLine
      L7_1 = L4_1
      L6_1, L7_1, L8_1, L9_1, L10_1 = L6_1(L7_1)
      L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1, L10_1)
      if L5_1 ~= nil then
        L6_1 = string
        L6_1 = L6_1.len
        L7_1 = L5_1
        L6_1 = L6_1(L7_1)
        if L6_1 ~= 0 then
          goto lbl_211
        end
      end
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      do return L6_1 end
      ::lbl_211::
      L6_1 = string
      L6_1 = L6_1.match
      L7_1 = L5_1
      L8_1 = "%-%-webview%-exe%-name=([^%s]+)"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= "outlook.exe" and L6_1 ~= "olk.exe" then
        L7_1 = mp
        L7_1 = L7_1.CLEAN
        return L7_1
      end
      L7_1 = mp
      L7_1 = L7_1.getfilename
      L8_1 = mp
      L8_1 = L8_1.bitor
      L9_1 = mp
      L9_1 = L9_1.FILEPATH_QUERY_FNAME
      L10_1 = mp
      L10_1 = L10_1.FILEPATH_QUERY_LOWERCASE
      L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
      L7_1 = L7_1(L8_1, L9_1, L10_1)
      if L7_1 ~= nil then
        L8_1 = string
        L8_1 = L8_1.len
        L9_1 = L7_1
        L8_1 = L8_1(L9_1)
        if not (L8_1 < 4) then
          goto lbl_244
        end
      end
      L8_1 = mp
      L8_1 = L8_1.CLEAN
      do return L8_1 end
      ::lbl_244::
      L8_1 = string
      L8_1 = L8_1.match
      L9_1 = L7_1
      L10_1 = "%.(%w+)$"
      L8_1 = L8_1(L9_1, L10_1)
      L3_1 = L8_1
      if L3_1 == nil or L3_1 == "" then
        L8_1 = mp
        L8_1 = L8_1.CLEAN
        return L8_1
      end
      if L3_1 == "crswap" then
        L8_1 = string
        L8_1 = L8_1.match
        L9_1 = L7_1
        L10_1 = "%.([^%.]+)%.crswap$"
        L8_1 = L8_1(L9_1, L10_1)
        L3_1 = L8_1
        if L3_1 == nil or L3_1 == "" then
          L8_1 = mp
          L8_1 = L8_1.CLEAN
          return L8_1
        end
      end
    end
  end
end
::lbl_272::
L4_1 = IsArchiveFileExt
L5_1 = L3_1
L4_1 = L4_1(L5_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "MpDisableCaching"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.get_mpattribute
  L5_1 = "Lua:ZipHasEncryptedFileWithExeExtension"
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.get_mpattribute
    L5_1 = "Lua:RarHasEncryptedFileWithExeExtension"
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      goto lbl_332
    end
  end
  L4_1 = MpCommon
  L4_1 = L4_1.GetPersistContextCount
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  if L4_1 == 0 then
    L4_1 = {}
    L5_1 = table
    L5_1 = L5_1.insert
    L6_1 = L4_1
    L7_1 = L2_1
    L5_1(L6_1, L7_1)
    L5_1 = MpCommon
    L5_1 = L5_1.SetPersistContext
    L6_1 = L1_1
    L7_1 = L4_1
    L8_1 = 0
    L5_1(L6_1, L7_1, L8_1)
  else
    L4_1 = MpCommon
    L4_1 = L4_1.QueryPersistContext
    L5_1 = L1_1
    L6_1 = L2_1
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L4_1 = MpCommon
      L4_1 = L4_1.AppendPersistContext
      L5_1 = L1_1
      L6_1 = L2_1
      L7_1 = 0
      L4_1(L5_1, L6_1, L7_1)
    end
  end
  L4_1 = mp
  L4_1 = L4_1.SetHipsRule
  L5_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.BLOCKACCESS
  do return L4_1 end
  ::lbl_332::
  L4_1 = MpCommon
  L4_1 = L4_1.GetPersistContextCount
  L5_1 = L1_1
  L4_1 = L4_1(L5_1)
  if L4_1 == 0 then
    L4_1 = {}
    L5_1 = table
    L5_1 = L5_1.insert
    L6_1 = L4_1
    L7_1 = "ContextualDropEncryptedArchiveByEmail"
    L5_1(L6_1, L7_1)
    L5_1 = MpCommon
    L5_1 = L5_1.SetPersistContext
    L6_1 = L1_1
    L7_1 = L4_1
    L8_1 = 0
    L5_1(L6_1, L7_1, L8_1)
  else
    L4_1 = MpCommon
    L4_1 = L4_1.QueryPersistContext
    L5_1 = L1_1
    L6_1 = "ContextualDropEncryptedArchiveByEmail"
    L4_1 = L4_1(L5_1, L6_1)
    if not L4_1 then
      L4_1 = MpCommon
      L4_1 = L4_1.AppendPersistContext
      L5_1 = L1_1
      L6_1 = "ContextualDropEncryptedArchiveByEmail"
      L7_1 = 300
      L4_1(L5_1, L6_1, L7_1)
    end
  end
  L4_1 = mp
  L4_1 = L4_1.getfilesize
  L4_1 = L4_1()
  if 10485760 < L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "//Lua:ContextualDropExecutableByEmailClient.B"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "MpForceScanArchives"
  L4_1(L5_1)
else
  L4_1 = IsSuspiciousFileExt
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 then
    if L3_1 == "dll" or L3_1 == "js" or L3_1 == "exe" then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = mp
      L5_1 = L5_1.ContextualExpandEnvironmentVariables
      L6_1 = "%userprofile%"
      L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L5_1(L6_1)
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
      L5_1 = nil
      if L4_1 ~= nil and L4_1 ~= "" then
        L6_1 = string
        L6_1 = L6_1.match
        L7_1 = L4_1
        L8_1 = "(%a:.*\\)[^\\]+$"
        L6_1 = L6_1(L7_1, L8_1)
        L5_1 = L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\local\\assembly\\te?mp\\[^\\]+\\.+%.dll"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\local\\assembly\\te?mp\\[^\\]+\\.+%.exe"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\local\\microsoft\\office\\[%d%.]+\\wef\\.+%.js"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\local\\microsoft\\office\\[%d%.]+\\smartlookupcache\\.+%.js"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\roaming\\imanage\\work\\plug_ins\\"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\roaming\\imanage\\work\\dll\\"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\roaming\\imanage\\work\\chromium\\"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\local\\imanage\\work\\plug_ins\\"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\local\\imanage\\work\\dll\\"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\local\\imanage\\work\\chromium\\"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\local\\microsoft\\windows\\inetcache\\ie\\[^\\]+\\.+%.js"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\local\\microsoft\\windows\\appcache\\%w+\\%d+\\.+%.js"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = "appdata\\local\\packages\\microsoft%.outlookforwindows_[^\\]+\\ac\\inetcache\\[^\\]+\\.+%.js"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = ".:\\windows\\microsoft%.net\\assembly\\gac_msil\\[^\\]+\\[^\\]+\\.+%.dll"
      L6_1 = L6_1(L7_1, L8_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = string
      L6_1 = L6_1.find
      L7_1 = L1_1
      L8_1 = ":\\program files (x86)\\zoom\\zoom outlook plugin\\x64\\zoomoutlookplugin64.dll"
      L9_1 = 1
      L10_1 = true
      L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1)
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      if L5_1 ~= nil and L5_1 ~= "" then
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L1_1
        L8_1 = L5_1
        L9_1 = "[^\\]+\\inetcache\\ie\\[^\\]+\\.+%.js"
        L8_1 = L8_1 .. L9_1
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 ~= nil then
          L6_1 = mp
          L6_1 = L6_1.CLEAN
          return L6_1
        end
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L1_1
        L8_1 = L5_1
        L9_1 = "[^\\]+\\appdata\\local\\temp\\%d+\\intresource64%.dll"
        L8_1 = L8_1 .. L9_1
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 ~= nil then
          L6_1 = mp
          L6_1 = L6_1.CLEAN
          return L6_1
        end
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L1_1
        L8_1 = L5_1
        L9_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\caseninja%.dll"
        L8_1 = L8_1 .. L9_1
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 ~= nil then
          L6_1 = mp
          L6_1 = L6_1.CLEAN
          return L6_1
        end
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L1_1
        L8_1 = L5_1
        L9_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\federatedauthentication%.dll"
        L8_1 = L8_1 .. L9_1
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 ~= nil then
          L6_1 = mp
          L6_1 = L6_1.CLEAN
          return L6_1
        end
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L1_1
        L8_1 = L5_1
        L9_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\sharedresources%.dll"
        L8_1 = L8_1 .. L9_1
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 ~= nil then
          L6_1 = mp
          L6_1 = L6_1.CLEAN
          return L6_1
        end
        L6_1 = string
        L6_1 = L6_1.find
        L7_1 = L1_1
        L8_1 = L5_1
        L9_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\mssolvehelper%-databroker%.exe"
        L8_1 = L8_1 .. L9_1
        L6_1 = L6_1(L7_1, L8_1)
        if L6_1 ~= nil then
          L6_1 = mp
          L6_1 = L6_1.CLEAN
          return L6_1
        end
      end
    end
    L4_1 = mp
    L4_1 = L4_1.set_mpattribute
    L5_1 = "MpDisableCaching"
    L4_1(L5_1)
    L4_1 = MpCommon
    L4_1 = L4_1.GetPersistContextCount
    L5_1 = L1_1
    L4_1 = L4_1(L5_1)
    if L4_1 == 0 then
      L4_1 = {}
      L5_1 = table
      L5_1 = L5_1.insert
      L6_1 = L4_1
      L7_1 = L2_1
      L5_1(L6_1, L7_1)
      L5_1 = MpCommon
      L5_1 = L5_1.SetPersistContext
      L6_1 = L1_1
      L7_1 = L4_1
      L8_1 = 0
      L5_1(L6_1, L7_1, L8_1)
    else
      L4_1 = MpCommon
      L4_1 = L4_1.QueryPersistContext
      L5_1 = L1_1
      L6_1 = L2_1
      L4_1 = L4_1(L5_1, L6_1)
      if not L4_1 then
        L4_1 = MpCommon
        L4_1 = L4_1.AppendPersistContext
        L5_1 = L1_1
        L6_1 = L2_1
        L7_1 = 0
        L4_1(L5_1, L6_1, L7_1)
      end
    end
    L4_1 = mp
    L4_1 = L4_1.SetHipsRule
    L5_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
    L4_1(L5_1)
    L4_1 = mp
    L4_1 = L4_1.BLOCKACCESS
    return L4_1
  elseif L3_1 == "lnk" then
    L4_1 = MpCommon
    L4_1 = L4_1.IsSampled
    L5_1 = 2000
    L6_1 = false
    L7_1 = true
    L8_1 = true
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
    if L4_1 == true then
      L4_1 = IsLnkPointingtoSuspFileExt
      L4_1 = L4_1()
      if L4_1 then
        L4_1 = mp
        L4_1 = L4_1.set_mpattribute
        L5_1 = "MpDisableCaching"
        L4_1(L5_1)
        L4_1 = MpCommon
        L4_1 = L4_1.GetPersistContextCount
        L5_1 = L1_1
        L4_1 = L4_1(L5_1)
        if L4_1 == 0 then
          L4_1 = {}
          L5_1 = table
          L5_1 = L5_1.insert
          L6_1 = L4_1
          L7_1 = L2_1
          L5_1(L6_1, L7_1)
          L5_1 = MpCommon
          L5_1 = L5_1.SetPersistContext
          L6_1 = L1_1
          L7_1 = L4_1
          L8_1 = 0
          L5_1(L6_1, L7_1, L8_1)
        else
          L4_1 = MpCommon
          L4_1 = L4_1.QueryPersistContext
          L5_1 = L1_1
          L6_1 = L2_1
          L4_1 = L4_1(L5_1, L6_1)
          if not L4_1 then
            L4_1 = MpCommon
            L4_1 = L4_1.AppendPersistContext
            L5_1 = L1_1
            L6_1 = L2_1
            L7_1 = 0
            L4_1(L5_1, L6_1, L7_1)
          end
        end
        L4_1 = mp
        L4_1 = L4_1.SetHipsRule
        L5_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
        L4_1(L5_1)
        L4_1 = mp
        L4_1 = L4_1.BLOCKACCESS
        return L4_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
