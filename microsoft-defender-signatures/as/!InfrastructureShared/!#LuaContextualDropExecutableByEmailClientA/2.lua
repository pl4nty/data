-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextualDropExecutableByEmailClientA\2.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
if not (mp.IsHipsRuleEnabled)("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550") then
  return mp.CLEAN
end
local l_0_1 = (versioning.GetOrgID)()
if l_0_1 ~= nil and (string.lower)(l_0_1) == "d4f6568c-6759-4e52-b6d5-1f957e335c91" then
  return mp.CLEAN
end
local l_0_2 = "enghipscpy:blockaccess:be9ba2d9-53ea-4cdc-84e5-9b1eeee46550"
local l_0_3 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if (mp.IsPathExcludedForHipsRule)(l_0_3, "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550") then
  return mp.CLEAN
end
if l_0_0 == mp.SCANREASON_ONOPEN then
  if not (MpCommon.QueryPersistContext)(l_0_3, l_0_2) then
    return mp.CLEAN
  end
  ;
  (mp.set_mpattribute)("MpDisableCaching")
  ;
  (mp.SetHipsRule)("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550")
  return mp.BLOCKEXECUTION
else
  if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
    if (mp.get_contextdata)(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true then
      return mp.CLEAN
    end
    if not IsEmailCachePath(l_0_3) then
      local l_0_4 = (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME))
      if l_0_4 ~= "outlook.exe" and l_0_4 ~= "olk.exe" and l_0_4 ~= "msedgewebview2.exe" then
        return mp.CLEAN
      end
      if l_0_4 == "msedgewebview2.exe" then
        local l_0_5 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
        local l_0_6 = (string.lower)((mp.GetProcessCommandLine)(l_0_5))
        if l_0_6 == nil or (string.len)(l_0_6) == 0 then
          return mp.CLEAN
        end
        local l_0_7 = (string.match)(l_0_6, "%-%-webview%-exe%-name=([^%s]+)")
        if l_0_7 ~= "outlook.exe" and l_0_7 ~= "olk.exe" then
          return mp.CLEAN
        end
      end
    end
    do
      local l_0_8 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
      if l_0_8 == nil or (string.len)(l_0_8) < 4 then
        return mp.CLEAN
      end
      local l_0_9 = nil
      l_0_9 = l_0_8:match("%.(%w+)$")
      if l_0_9 == nil then
        return mp.CLEAN
      end
      if (string.lower)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)) == "msedgewebview2.exe" and l_0_9 == "crswap" then
        l_0_9 = l_0_8:match("%.([^%.]+)%.crswap$")
        if l_0_9 == nil then
          return mp.CLEAN
        end
      end
      if IsArchiveFileExt(l_0_9) then
        (mp.set_mpattribute)("MpDisableCaching")
        if (mp.get_mpattribute)("Lua:ZipHasEncryptedFileWithExeExtension") or (mp.get_mpattribute)("Lua:RarHasEncryptedFileWithExeExtension") then
          if (MpCommon.GetPersistContextCount)(l_0_3) == 0 then
            local l_0_10 = {}
            ;
            (table.insert)(l_0_10, l_0_2)
            ;
            (MpCommon.SetPersistContext)(l_0_3, l_0_10, 0)
          else
            do
              if not (MpCommon.QueryPersistContext)(l_0_3, l_0_2) then
                (MpCommon.AppendPersistContext)(l_0_3, l_0_2, 0)
              end
              ;
              (mp.SetHipsRule)("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550")
              do return mp.BLOCKACCESS end
              if (MpCommon.GetPersistContextCount)(l_0_3) == 0 then
                local l_0_11 = {}
                ;
                (table.insert)(l_0_11, "ContextualDropEncryptedArchiveByEmail")
                ;
                (MpCommon.SetPersistContext)(l_0_3, l_0_11, 0)
              else
                do
                  if not (MpCommon.QueryPersistContext)(l_0_3, "ContextualDropEncryptedArchiveByEmail") then
                    (MpCommon.AppendPersistContext)(l_0_3, "ContextualDropEncryptedArchiveByEmail", 300)
                  end
                  if (mp.getfilesize)() > 10485760 then
                    return mp.CLEAN
                  end
                  ;
                  (mp.set_mpattribute)("//Lua:ContextualDropExecutableByEmailClient.B")
                  ;
                  (mp.set_mpattribute)("MpForceScanArchives")
                  if IsSuspiciousFileExt(l_0_9) then
                    if l_0_9 == "dll" or l_0_9 == "js" or l_0_9 == "exe" then
                      local l_0_12 = ((string.lower)((mp.ContextualExpandEnvironmentVariables)("%userprofile%")))
                      local l_0_13 = nil
                      if l_0_12 ~= nil and l_0_12 ~= "" then
                        l_0_13 = (string.match)(l_0_12, "(%a:.*\\)[^\\]+$")
                      end
                      if (string.find)(l_0_3, "appdata\\local\\assembly\\te?mp\\[^\\]+\\.+%.dll") ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\local\\assembly\\te?mp\\[^\\]+\\.+%.exe") ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\local\\microsoft\\office\\[%d%.]+\\wef\\.+%.js") ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\local\\microsoft\\office\\[%d%.]+\\smartlookupcache\\.+%.js") ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\roaming\\imanage\\work\\plug_ins\\", 1, true) ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\roaming\\imanage\\work\\dll\\", 1, true) ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\roaming\\imanage\\work\\chromium\\", 1, true) ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\local\\imanage\\work\\plug_ins\\", 1, true) ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\local\\imanage\\work\\dll\\", 1, true) ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\local\\imanage\\work\\chromium\\", 1, true) ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\local\\microsoft\\windows\\inetcache\\ie\\[^\\]+\\.+%.js") ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\local\\microsoft\\windows\\appcache\\%w+\\%d+\\.+%.js") ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, "appdata\\local\\packages\\microsoft%.outlookforwindows_[^\\]+\\ac\\inetcache\\[^\\]+\\.+%.js") ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, ".:\\windows\\microsoft%.net\\assembly\\gac_msil\\[^\\]+\\[^\\]+\\.+%.dll") ~= nil then
                        return mp.CLEAN
                      end
                      if (string.find)(l_0_3, ":\\program files (x86)\\zoom\\zoom outlook plugin\\x64\\zoomoutlookplugin64.dll", 1, true) ~= nil then
                        return mp.CLEAN
                      end
                      if l_0_13 ~= nil and l_0_13 ~= "" then
                        if (string.find)(l_0_3, l_0_13 .. "[^\\]+\\inetcache\\ie\\[^\\]+\\.+%.js") ~= nil then
                          return mp.CLEAN
                        end
                        if (string.find)(l_0_3, l_0_13 .. "[^\\]+\\appdata\\local\\temp\\%d+\\intresource64%.dll") ~= nil then
                          return mp.CLEAN
                        end
                        if (string.find)(l_0_3, l_0_13 .. "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\caseninja%.dll") ~= nil then
                          return mp.CLEAN
                        end
                        if (string.find)(l_0_3, l_0_13 .. "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\federatedauthentication%.dll") ~= nil then
                          return mp.CLEAN
                        end
                        if (string.find)(l_0_3, l_0_13 .. "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\sharedresources%.dll") ~= nil then
                          return mp.CLEAN
                        end
                        if (string.find)(l_0_3, l_0_13 .. "[^\\]+\\appdata\\local\\temp\\deployment\\[^\\]+\\[^\\]+\\mssolvehelper%-databroker%.exe") ~= nil then
                          return mp.CLEAN
                        end
                      end
                    end
                    do
                      ;
                      (mp.set_mpattribute)("MpDisableCaching")
                      if (MpCommon.GetPersistContextCount)(l_0_3) == 0 then
                        local l_0_14 = {}
                        ;
                        (table.insert)(l_0_14, l_0_2)
                        ;
                        (MpCommon.SetPersistContext)(l_0_3, l_0_14, 0)
                      else
                        do
                          do
                            if not (MpCommon.QueryPersistContext)(l_0_3, l_0_2) then
                              (MpCommon.AppendPersistContext)(l_0_3, l_0_2, 0)
                            end
                            ;
                            (mp.SetHipsRule)("be9ba2d9-53ea-4cdc-84e5-9b1eeee46550")
                            do return mp.BLOCKACCESS end
                            return mp.CLEAN
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

