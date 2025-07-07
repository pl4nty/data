-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSPersistenceTrackerAB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_3 = false
if (string.find)(l_0_1, "/system/library/launch", 1, true) ~= 1 then
  local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  do
    suspNameCheck = function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_4, l_0_1, l_0_2
  if (string.find)(l_1_0, "com.apple.", 1, true) == 1 then
    (MpCommon.BmTriggerSig)(l_0_4, "BM_SuspMacLaunchItemName", l_0_1 .. "/" .. l_0_2)
  end
end

    if (string.find)(l_0_1, "/library/launchagents", 1, true) then
      if (string.find)(l_0_1, "/users/", 1, true) == 1 then
        TrackPidAndTechnique(l_0_4, "T1543.001", "Persistence_UserLaunchAgent")
      else
        TrackPidAndTechnique(l_0_4, "T1543.001", "Persistence_GlobalLaunchAgent")
      end
      suspNameCheck(l_0_2)
      l_0_3 = true
    else
      if (string.find)(l_0_1, "/library/launchdaemons", 1, true) == 1 then
        TrackPidAndTechnique(l_0_4, "T1543.004", "Persistence_LaunchDaemon")
        suspNameCheck(l_0_2)
        l_0_3 = true
      end
    end
    if l_0_3 then
      IsProcessExcluded = function(l_2_0)
  -- function num : 0_1
  if l_2_0 == "" or l_2_0 == nil then
    return true
  end
  if (string.find)(l_2_0, "/bin/", 1, true) == 1 or (((string.find)(l_2_0, "/usr/", 1, true) == 1 and (string.find)(l_2_0, "/usr/local/", 1, true) ~= 1) or (string.find)(l_2_0, "/Applications/Microsoft Defender.app/", 1, true) == 1) then
    return true
  end
  return false
end

      local l_0_5 = (mp.getfilesize)()
      if l_0_5 > 10000 then
        return mp.CLEAN
      end
      ;
      (mp.readprotection)(false)
      local l_0_6 = (mp.readfile)(0, l_0_5)
      ;
      (mp.readprotection)(true)
      if not l_0_6 then
        return mp.CLEAN
      end
      fileCheckPassed = function(l_3_0)
  -- function num : 0_2
  if l_3_0 ~= "" and l_3_0 ~= nil and #l_3_0 > 10 and (string.find)(l_3_0, "/", 1, true) == 1 and not IsProcessExcluded(l_3_0) then
    return true
  end
  return false
end

      SuspPersistence = function(l_4_0)
  -- function num : 0_3 , upvalues : l_0_4, l_0_1, l_0_2
  if l_4_0 ~= nil and l_4_0 ~= "" then
    l_4_0 = (string.lower)(l_4_0)
    if l_4_0:match("osascript.*with%sadministrator%sprivileges") or l_4_0:match("echo.*/bin/bash") or l_4_0:match("echo.*/bin/zsh") or l_4_0:match("echo.*/bin/sh") or l_4_0:match("base64%s%-d") then
      (MpCommon.BmTriggerSig)(l_0_4, "BM_SuspMacLaunchItem", l_0_1 .. "/" .. l_0_2)
      return true
    end
  end
  return false
end

      local l_0_7 = ""
      local l_0_8 = {}
      do
        if (string.find)(l_0_6, "<key>Program</key>", 1, true) then
          local l_0_9 = l_0_6:match("<key>Program</key>%s-<string>(.-)</string>")
          if l_0_9 ~= nil and l_0_9 ~= "" then
            if fileCheckPassed(l_0_9) then
              (table.insert)(l_0_8, l_0_9)
            end
            l_0_7 = l_0_7 .. " " .. l_0_9
          end
        end
        if (string.find)(l_0_6, "<key>ProgramArguments</key>", 1, true) then
          for l_0_13 in l_0_6:gmatch("<key>ProgramArguments</key>%s*<array>(.-)</array>") do
            for l_0_17 in l_0_13:gmatch("<string>(.-)</string>") do
              if l_0_17 ~= nil and l_0_17 ~= "" then
                if fileCheckPassed(l_0_17) then
                  (table.insert)(l_0_8, l_0_17)
                end
                l_0_7 = l_0_7 .. " " .. l_0_17
              end
            end
          end
        end
        do
          if SuspPersistence(l_0_7) then
            return mp.INFECTED
          end
          checkAdhocUnsigned = function(l_5_0)
  -- function num : 0_4
  local l_5_1 = "MAC_UNSIGNED_ADHOC_PATHS"
  local l_5_2 = "unsigned_adhoc_items"
  if GetRollingQueueCount(l_5_1) > 0 and IsKeyValuePairInRollingQueue(l_5_1, l_5_2, l_5_0) then
    return true
  end
  return false
end

          if l_0_8 and #l_0_8 > 0 then
            local l_0_18 = "MAC_PERSIST_PROG_PATHS"
            for l_0_22,l_0_23 in pairs(l_0_8) do
              if (sysio.IsFileExists)(R16_PC241) then
                AppendToRollingQueue(R16_PC241, l_0_2, R18_PC251, 3600, 10, 0)
                -- DECOMPILER ERROR at PC253: Overwrote pending register: R16 in 'AssignReg'

                -- DECOMPILER ERROR at PC259: Overwrote pending register: R16 in 'AssignReg'

                if checkAdhocUnsigned(R16_PC241) then
                  (mp.ReportLowfi)(R16_PC241, 1523570201)
                  return mp.INFECTED
                end
              end
            end
          end
        end
        do
          l_0_4 = mp
          l_0_4 = l_0_4.CLEAN
          return l_0_4
        end
      end
    end
  end
end

