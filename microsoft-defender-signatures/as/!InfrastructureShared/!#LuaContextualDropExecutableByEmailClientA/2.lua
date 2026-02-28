local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONOPEN
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 ~= L1_1 then
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
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
L1_1 = versioning
L1_1 = L1_1.GetOrgID
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  if L2_1 == "d4f6568c-6759-4e52-b6d5-1f957e335c91" then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = "enghipscpy:blockaccess:be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
L3_1 = mp
L3_1 = L3_1.getfilename
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = MpCommon
L4_1 = L4_1.PathToWin32Path
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.lower
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L3_1 = L4_1
L4_1 = mp
L4_1 = L4_1.IsPathExcludedForHipsRule
L5_1 = L3_1
L6_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
L4_1 = L4_1(L5_1, L6_1)
if L4_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.SCANREASON_ONOPEN
if L0_1 == L4_1 then
  L4_1 = MpCommon
  L4_1 = L4_1.QueryPersistContext
  L5_1 = L3_1
  L6_1 = L2_1
  L4_1 = L4_1(L5_1, L6_1)
  if not L4_1 then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = mp
  L4_1 = L4_1.set_mpattribute
  L5_1 = "MpDisableCaching"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.SetHipsRule
  L5_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
  L4_1(L5_1)
  L4_1 = mp
  L4_1 = L4_1.BLOCKEXECUTION
  return L4_1
else
  L4_1 = mp
  L4_1 = L4_1.SCANREASON_ONMODIFIEDHANDLECLOSE
  if L0_1 == L4_1 then
    L4_1 = mp
    L4_1 = L4_1.get_contextdata
    L5_1 = mp
    L5_1 = L5_1.CONTEXT_DATA_NEWLYCREATEDHINT
    L4_1 = L4_1(L5_1)
    if L4_1 ~= true then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = IsEmailCachePath
    L5_1 = L3_1
    L4_1 = L4_1(L5_1)
    if not L4_1 then
      L4_1 = string
      L4_1 = L4_1.lower
      L5_1 = mp
      L5_1 = L5_1.get_contextdata
      L6_1 = mp
      L6_1 = L6_1.CONTEXT_DATA_PROCESSNAME
      L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L5_1(L6_1)
      L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
      if L4_1 ~= "outlook.exe" and L4_1 ~= "olk.exe" and L4_1 ~= "msedgewebview2.exe" then
        L5_1 = mp
        L5_1 = L5_1.CLEAN
        return L5_1
      end
      if L4_1 == "msedgewebview2.exe" then
        L5_1 = mp
        L5_1 = L5_1.get_contextdata
        L6_1 = mp
        L6_1 = L6_1.CONTEXT_DATA_PROCESS_PPID
        L5_1 = L5_1(L6_1)
        L6_1 = string
        L6_1 = L6_1.lower
        L7_1 = mp
        L7_1 = L7_1.GetProcessCommandLine
        L8_1 = L5_1
        L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L7_1(L8_1)
        L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
        if L6_1 ~= nil then
          L7_1 = string
          L7_1 = L7_1.len
          L8_1 = L6_1
          L7_1 = L7_1(L8_1)
          if L7_1 ~= 0 then
            goto lbl_163
          end
        end
        L7_1 = mp
        L7_1 = L7_1.CLEAN
        do return L7_1 end
        ::lbl_163::
        L7_1 = string
        L7_1 = L7_1.match
        L8_1 = L6_1
        L9_1 = "%-%-webview%-exe%-name=([^%s]+)"
        L7_1 = L7_1(L8_1, L9_1)
        if L7_1 ~= "outlook.exe" and L7_1 ~= "olk.exe" then
          L8_1 = mp
          L8_1 = L8_1.CLEAN
          return L8_1
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
    L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L5_1(L6_1, L7_1)
    L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
    if L4_1 ~= nil then
      L5_1 = string
      L5_1 = L5_1.len
      L6_1 = L4_1
      L5_1 = L5_1(L6_1)
      if not (L5_1 < 4) then
        goto lbl_196
      end
    end
    L5_1 = mp
    L5_1 = L5_1.CLEAN
    do return L5_1 end
    ::lbl_196::
    L5_1 = nil
    L7_1 = L4_1
    L6_1 = L4_1.match
    L8_1 = "%.(%w+)$"
    L6_1 = L6_1(L7_1, L8_1)
    L5_1 = L6_1
    if L5_1 == nil then
      L6_1 = mp
      L6_1 = L6_1.CLEAN
      return L6_1
    end
    L6_1 = string
    L6_1 = L6_1.lower
    L7_1 = mp
    L7_1 = L7_1.get_contextdata
    L8_1 = mp
    L8_1 = L8_1.CONTEXT_DATA_PROCESSNAME
    L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L7_1(L8_1)
    L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
    if L6_1 == "msedgewebview2.exe" and L5_1 == "crswap" then
      L7_1 = L4_1
      L6_1 = L4_1.match
      L8_1 = "%.([^%.]+)%.crswap$"
      L6_1 = L6_1(L7_1, L8_1)
      L5_1 = L6_1
      if L5_1 == nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
    end
    L6_1 = IsArchiveFileExt
    L7_1 = L5_1
    L6_1 = L6_1(L7_1)
    if L6_1 then
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "MpDisableCaching"
      L6_1(L7_1)
      L6_1 = mp
      L6_1 = L6_1.get_mpattribute
      L7_1 = "Lua:ZipHasEncryptedFileWithExeExtension"
      L6_1 = L6_1(L7_1)
      if not L6_1 then
        L6_1 = mp
        L6_1 = L6_1.get_mpattribute
        L7_1 = "Lua:RarHasEncryptedFileWithExeExtension"
        L6_1 = L6_1(L7_1)
        if not L6_1 then
          goto lbl_287
        end
      end
      L6_1 = MpCommon
      L6_1 = L6_1.GetPersistContextCount
      L7_1 = L3_1
      L6_1 = L6_1(L7_1)
      if L6_1 == 0 then
        L6_1 = {}
        L7_1 = table
        L7_1 = L7_1.insert
        L8_1 = L6_1
        L9_1 = L2_1
        L7_1(L8_1, L9_1)
        L7_1 = MpCommon
        L7_1 = L7_1.SetPersistContext
        L8_1 = L3_1
        L9_1 = L6_1
        L10_1 = 0
        L7_1(L8_1, L9_1, L10_1)
      else
        L6_1 = MpCommon
        L6_1 = L6_1.QueryPersistContext
        L7_1 = L3_1
        L8_1 = L2_1
        L6_1 = L6_1(L7_1, L8_1)
        if not L6_1 then
          L6_1 = MpCommon
          L6_1 = L6_1.AppendPersistContext
          L7_1 = L3_1
          L8_1 = L2_1
          L9_1 = 0
          L6_1(L7_1, L8_1, L9_1)
        end
      end
      L6_1 = mp
      L6_1 = L6_1.SetHipsRule
      L7_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
      L6_1(L7_1)
      L6_1 = mp
      L6_1 = L6_1.BLOCKACCESS
      do return L6_1 end
      ::lbl_287::
      L6_1 = MpCommon
      L6_1 = L6_1.GetPersistContextCount
      L7_1 = L3_1
      L6_1 = L6_1(L7_1)
      if L6_1 == 0 then
        L6_1 = {}
        L7_1 = table
        L7_1 = L7_1.insert
        L8_1 = L6_1
        L9_1 = "ContextualDropEncryptedArchiveByEmail"
        L7_1(L8_1, L9_1)
        L7_1 = MpCommon
        L7_1 = L7_1.SetPersistContext
        L8_1 = L3_1
        L9_1 = L6_1
        L10_1 = 0
        L7_1(L8_1, L9_1, L10_1)
      else
        L6_1 = MpCommon
        L6_1 = L6_1.QueryPersistContext
        L7_1 = L3_1
        L8_1 = "ContextualDropEncryptedArchiveByEmail"
        L6_1 = L6_1(L7_1, L8_1)
        if not L6_1 then
          L6_1 = MpCommon
          L6_1 = L6_1.AppendPersistContext
          L7_1 = L3_1
          L8_1 = "ContextualDropEncryptedArchiveByEmail"
          L9_1 = 300
          L6_1(L7_1, L8_1, L9_1)
        end
      end
      L6_1 = mp
      L6_1 = L6_1.getfilesize
      L6_1 = L6_1()
      if 10485760 < L6_1 then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "//Lua:ContextualDropExecutableByEmailClient.B"
      L6_1(L7_1)
      L6_1 = mp
      L6_1 = L6_1.set_mpattribute
      L7_1 = "MpForceScanArchives"
      L6_1(L7_1)
    else
      L6_1 = IsSuspiciousFileExt
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      if L6_1 then
        if L5_1 == "dll" or L5_1 == "js" or L5_1 == "exe" then
          L6_1 = string
          L6_1 = L6_1.lower
          L7_1 = mp
          L7_1 = L7_1.ContextualExpandEnvironmentVariables
          L8_1 = "%userprofile%"
          L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L7_1(L8_1)
          L6_1 = L6_1(L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
          L7_1 = nil
          if L6_1 ~= nil and L6_1 ~= "" then
            L8_1 = string
            L8_1 = L8_1.match
            L9_1 = L6_1
            L10_1 = "(%a:.*\\)[^\\]+$"
            L8_1 = L8_1(L9_1, L10_1)
            L7_1 = L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\local\\assembly\\te?mp\\[^\\]+\\.+%.dll"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\local\\assembly\\te?mp\\[^\\]+\\.+%.exe"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\local\\microsoft\\office\\[%d%.]+\\wef\\.+%.js"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\local\\microsoft\\office\\[%d%.]+\\smartlookupcache\\.+%.js"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\roaming\\imanage\\work\\plug_ins\\"
          L11_1 = 1
          L12_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\roaming\\imanage\\work\\dll\\"
          L11_1 = 1
          L12_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\roaming\\imanage\\work\\chromium\\"
          L11_1 = 1
          L12_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\local\\imanage\\work\\plug_ins\\"
          L11_1 = 1
          L12_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\local\\imanage\\work\\dll\\"
          L11_1 = 1
          L12_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\local\\imanage\\work\\chromium\\"
          L11_1 = 1
          L12_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\local\\microsoft\\windows\\inetcache\\ie\\[^\\]+\\.+%.js"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\local\\microsoft\\windows\\appcache\\%w+\\%d+\\.+%.js"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = "appdata\\local\\packages\\microsoft%.outlookforwindows_[^\\]+\\ac\\inetcache\\[^\\]+\\.+%.js"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = ".:\\windows\\microsoft%.net\\assembly\\gac_msil\\[^\\]+\\[^\\]+\\.+%.dll"
          L8_1 = L8_1(L9_1, L10_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          L8_1 = string
          L8_1 = L8_1.find
          L9_1 = L3_1
          L10_1 = ":\\program files (x86)\\zoom\\zoom outlook plugin\\x64\\zoomoutlookplugin64.dll"
          L11_1 = 1
          L12_1 = true
          L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
          if L8_1 ~= nil then
            L8_1 = mp
            L8_1 = L8_1.CLEAN
            return L8_1
          end
          if L7_1 ~= nil and L7_1 ~= "" then
            L8_1 = string
            L8_1 = L8_1.find
            L9_1 = L3_1
            L10_1 = L7_1
            L11_1 = "[^\\]+\\inetcache\\ie\\[^\\]+\\.+%.js"
            L10_1 = L10_1 .. L11_1
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 ~= nil then
              L8_1 = mp
              L8_1 = L8_1.CLEAN
              return L8_1
            end
            L8_1 = string
            L8_1 = L8_1.find
            L9_1 = L3_1
            L10_1 = L7_1
            L11_1 = "[^\\]+\\appdata\\local\\temp\\%d+\\intresource64%.dll"
            L10_1 = L10_1 .. L11_1
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 ~= nil then
              L8_1 = mp
              L8_1 = L8_1.CLEAN
              return L8_1
            end
            L8_1 = string
            L8_1 = L8_1.find
            L9_1 = L3_1
            L10_1 = L7_1
            L11_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\caseninja%.dll"
            L10_1 = L10_1 .. L11_1
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 ~= nil then
              L8_1 = mp
              L8_1 = L8_1.CLEAN
              return L8_1
            end
            L8_1 = string
            L8_1 = L8_1.find
            L9_1 = L3_1
            L10_1 = L7_1
            L11_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\federatedauthentication%.dll"
            L10_1 = L10_1 .. L11_1
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 ~= nil then
              L8_1 = mp
              L8_1 = L8_1.CLEAN
              return L8_1
            end
            L8_1 = string
            L8_1 = L8_1.find
            L9_1 = L3_1
            L10_1 = L7_1
            L11_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\sharedresources%.dll"
            L10_1 = L10_1 .. L11_1
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 ~= nil then
              L8_1 = mp
              L8_1 = L8_1.CLEAN
              return L8_1
            end
            L8_1 = string
            L8_1 = L8_1.find
            L9_1 = L3_1
            L10_1 = L7_1
            L11_1 = "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\mssolvehelper%-databroker%.exe"
            L10_1 = L10_1 .. L11_1
            L8_1 = L8_1(L9_1, L10_1)
            if L8_1 ~= nil then
              L8_1 = mp
              L8_1 = L8_1.CLEAN
              return L8_1
            end
          end
        end
        L6_1 = mp
        L6_1 = L6_1.set_mpattribute
        L7_1 = "MpDisableCaching"
        L6_1(L7_1)
        L6_1 = MpCommon
        L6_1 = L6_1.GetPersistContextCount
        L7_1 = L3_1
        L6_1 = L6_1(L7_1)
        if L6_1 == 0 then
          L6_1 = {}
          L7_1 = table
          L7_1 = L7_1.insert
          L8_1 = L6_1
          L9_1 = L2_1
          L7_1(L8_1, L9_1)
          L7_1 = MpCommon
          L7_1 = L7_1.SetPersistContext
          L8_1 = L3_1
          L9_1 = L6_1
          L10_1 = 0
          L7_1(L8_1, L9_1, L10_1)
        else
          L6_1 = MpCommon
          L6_1 = L6_1.QueryPersistContext
          L7_1 = L3_1
          L8_1 = L2_1
          L6_1 = L6_1(L7_1, L8_1)
          if not L6_1 then
            L6_1 = MpCommon
            L6_1 = L6_1.AppendPersistContext
            L7_1 = L3_1
            L8_1 = L2_1
            L9_1 = 0
            L6_1(L7_1, L8_1, L9_1)
          end
        end
        L6_1 = mp
        L6_1 = L6_1.SetHipsRule
        L7_1 = "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
        L6_1(L7_1)
        L6_1 = mp
        L6_1 = L6_1.BLOCKACCESS
        return L6_1
      end
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
