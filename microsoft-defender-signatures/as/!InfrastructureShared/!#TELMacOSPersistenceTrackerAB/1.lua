-- Threat: !InfrastructureShared
-- Name: !#TEL:MacOS/PersistenceTracker.AB
-- Type: 12
-- Includes: TechniqueTracker, LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & BM_XML_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_3 = false
if string.find(l_0_1, "/System/Library/Launch", 1, true) ~= 1 then
  do
    local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
    
    function suspNameCheck(l_1_0)
      if string.find(string.lower(l_1_0), "com.apple.", 1, true) == 1 then
        MpCommon.BmTriggerSig(l_0_4, "BM_SuspMacLaunchItemName", l_0_1 .. "/" .. l_0_2)
      end
    end
    
    if string.find(l_0_1, "/Library/LaunchAgents", 1, true) then
      if string.find(l_0_1, "/Users/", 1, true) == 1 then
        TrackPidAndTechnique(l_0_4, "T1543.001", "Persistence_UserLaunchAgent")
      else
        TrackPidAndTechnique(l_0_4, "T1543.001", "Persistence_GlobalLaunchAgent")
      end
      suspNameCheck(l_0_2)
      l_0_3 = true
    elseif string.find(l_0_1, "/Library/LaunchDaemons", 1, true) == 1 then
      TrackPidAndTechnique(l_0_4, "T1543.004", "Persistence_LaunchDaemon")
      suspNameCheck(l_0_2)
      l_0_3 = true
    end
    if l_0_3 then
      function IsProcessExcluded(l_2_0)
        if l_2_0 == "" or l_2_0 == nil then
          return true
        end
        if string.find(l_2_0, "/bin/", 1, true) == 1 or string.find(l_2_0, "/System/", 1, true) == 1 or string.find(l_2_0, "/sbin/", 1, true) == 1 or string.find(l_2_0, "/Library/Apple/", 1, true) == 1 or string.find(l_2_0, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_2_0, "/usr/", 1, true) == 1 and string.find(l_2_0, "/usr/local/", 1, true) ~= 1 or string.find(l_2_0, "/Applications/Microsoft Defender.app/", 1, true) == 1 then
          return true
        end
        return false
      end
      
      local l_0_5 = mp.getfilesize()
      if 10000 < l_0_5 then
        return mp.CLEAN
      end
      mp.readprotection(false)
      local l_0_6 = mp.readfile(0, l_0_5)
      mp.readprotection(true)
      if not l_0_6 then
        return mp.CLEAN
      end
      
      function fileCheckPassed(l_3_0)
        if l_3_0 ~= "" and l_3_0 ~= nil and 10 < #l_3_0 and string.find(l_3_0, "/", 1, true) == 1 and not IsProcessExcluded(l_3_0) then
          return true
        end
        return false
      end
      
      function SuspPersistence(l_4_0)
        if l_4_0 ~= nil and l_4_0 ~= "" then
          l_4_0 = string.lower(l_4_0)
          if l_4_0:match("osascript.*with%sadministrator%sprivileges") or l_4_0:match("echo.*/bin/bash") or l_4_0:match("echo.*/bin/zsh") or l_4_0:match("echo.*/bin/sh") or l_4_0:match("base64%s%-d") then
            MpCommon.BmTriggerSig(l_0_4, "BM_SuspMacLaunchItem", l_0_1 .. "/" .. l_0_2)
            return true
          end
        end
        return false
      end
      
      local l_0_7 = ""
      local l_0_8 = {}
      if string.find(l_0_6, "<key>Program</key>", 1, true) then
        local l_0_9 = l_0_6:match("<key>Program</key>%s-<string>(.-)</string>")
        if l_0_9 ~= nil and l_0_9 ~= "" then
          if fileCheckPassed(l_0_9) then
            table.insert(l_0_8, l_0_9)
          end
          l_0_7 = l_0_7 .. " " .. l_0_9
        end
      end
      if string.find(l_0_6, "<key>ProgramArguments</key>", 1, true) then
        for l_0_10 in l_0_6:gmatch("<key>ProgramArguments</key>%s*<array>(.-)</array>") do
          for l_0_11 in l_0_10:gmatch("<string>(.-)</string>") do
            if l_0_11 ~= nil and l_0_11 ~= "" then
              if fileCheckPassed(l_0_11) then
                table.insert(l_0_8, l_0_11)
              end
              l_0_7 = l_0_7 .. " " .. l_0_11
            end
          end
        end
      end
      if SuspPersistence(l_0_7) then
        return mp.INFECTED
      end
      
      function checkAdhocUnsigned(l_5_0)
        local l_5_1 = "MAC_UNSIGNED_ADHOC_PATHS"
        local l_5_2 = "unsigned_adhoc_items"
        if GetRollingQueueCount(l_5_1) > 0 and IsKeyValuePairInRollingQueue(l_5_1, l_5_2, l_5_0) then
          return true
        end
        return false
      end
      
      if l_0_8 and 0 < #l_0_8 then
        local l_0_12 = "MAC_PERSIST_PROG_PATHS"
        for l_0_13, l_0_14 in pairs(l_0_8) do
          if sysio.IsFileExists(l_0_14) then
            local l_0_15 = 86400
            AppendToRollingQueue(l_0_12, l_0_2, l_0_14, l_0_15, 50, 0)
            if checkAdhocUnsigned(l_0_14) then
              mp.ReportLowfi(l_0_14, 1523570201)
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
