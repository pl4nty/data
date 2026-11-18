-- Threat: !InfrastructureShared
-- Name: fcb33325d37a
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib, AppomalyHelpers

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
  if not l_0_0 or #l_0_0 < 5 then
    return mp.CLEAN
  end
  if contains(l_0_0, {
    "osdsetuphook"
  }) then
    return mp.CLEAN
  end
  local l_0_1 = {}
  local l_0_2 = 0
  local l_0_3, l_0_4 = pcall(mp.GetExecutablesFromCommandLine, l_0_0)
  if l_0_3 and l_0_4 then
    for l_0_5, l_0_6 in ipairs(l_0_4) do
      local l_0_7 = {}
      l_0_7.path = l_0_6
      l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
      if l_0_6 then
        local l_0_8 = mp.IsKnownFriendlyFile(l_0_6, true, false)
        bm.add_related_string("FriendlyFile", l_0_6, bm.RelatedStringBMReport)
        if l_0_8 == nil or l_0_8 == false then
          local l_0_9 = 0
          local l_0_10 = 0
          local l_0_11 = MpCommon.PathToWin32Path(l_0_6)
          if l_0_11 and string.match(l_0_11, "^[%a]:\\") then
            l_0_9 = sysio.GetFileSize(l_0_11)
            l_0_7.size = l_0_9
            if sysio.IsFileExists(l_0_11) then
              local l_0_12 = sysio.GetFileLastWriteTime(l_0_11)
              l_0_12 = l_0_12 / 10000000 - 11644473600
              local l_0_13 = MpCommon.GetCurrentTimeT()
              l_0_10 = l_0_13 - l_0_12
              l_0_7.age = l_0_10
              bm.add_related_file(l_0_11)
              local l_0_14 = string.lower(l_0_11)
              if string.find(l_0_14, ".exe", 1, true) then
                do
                  local l_0_15, l_0_16 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped", l_0_14)
                  if l_0_15 and l_0_16 then
                    if l_0_16.value then
                      l_0_16 = {l_0_16}
                    end
                    for l_0_17, l_0_18 in ipairs(l_0_16) do
                      if string.find(l_0_18.value, "UnsignedFile", 1, true) and FiletimeToDaysElapsed(l_0_18.insert_time) < 2 then
                        l_0_7.FileDroppedRecently = true
                        l_0_7.FileDropperInfo = l_0_16
                        l_0_2 = l_0_2 + 50
                        local l_0_19 = string.match(l_0_18.value, "Process_Img(.*)")
                        if l_0_19 and contains(l_0_19, {
                          "explorer.exe",
                          "WinRAR.exe",
                          "7z.exe"
                        }) then
                          l_0_2 = l_0_2 + 50
                        end
                        if string.find(l_0_18.value, "FileAttributes", 1, true) then
                          local l_0_20 = string.match(l_0_18.value, "%[(.*)%]")
                          for l_0_21 in string.gmatch(l_0_20, "([^|]+)") do
                            l_0_2 = l_0_2 + 1
                            if l_0_21 == "SLF:HighRiskHasMotW" then
                              l_0_2 = l_0_2 + 100
                            end
                          end
                        end
                        l_0_7.score = l_0_2
                        break
                      end
                    end
                  end
                end
              else
                local l_0_22, l_0_23 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentScriptDropped", l_0_14)
                if l_0_22 and l_0_23 then
                  if l_0_23.value then
                    l_0_23 = {l_0_23}
                  end
                  for l_0_24, l_0_25 in ipairs(l_0_23) do
                    if FiletimeToDaysElapsed(l_0_25.insert_time) < 2 then
                      l_0_7.FileDroppedRecently = true
                      l_0_7.FileDropperInfo = l_0_23
                      l_0_2 = l_0_2 + 50
                      local l_0_26 = string.match(l_0_25.value, "Process_Img(.*)")
                      if l_0_26 and contains(l_0_26, {
                        "explorer.exe",
                        "WinRAR.exe",
                        "7z.exe"
                      }) then
                        l_0_2 = l_0_2 + 50
                      end
                      if string.find(l_0_25.value, "FileAttributes", 1, true) then
                        local l_0_27 = string.match(l_0_25.value, "%[(.*)%]")
                        for l_0_28 in string.gmatch(l_0_27, "([^|]+)") do
                          l_0_2 = l_0_2 + 1
                          if l_0_28 == "SLF:HighRiskHasMotW" then
                            l_0_2 = l_0_2 + 100
                          end
                        end
                      end
                      l_0_7.score = l_0_2
                      break
                    end
                  end
                end
              end
              table.insert(l_0_1, l_0_7)
            end
          end
        end
      end
    end
  end
  if next(l_0_1) then
    local l_0_29 = safeJsonSerialize(l_0_1)
    bm.add_related_string("UntrustedEntities", l_0_29, bm.RelatedStringBMReport)
    if 0 < l_0_2 then
      bm.trigger_sig("SetupMode_Block", "untrusted_entities")
    end
  end
  if contains(l_0_0, {
    "software\\Microsoft\\"
  }) then
    bm.trigger_sig("SetupMode_Block", "script_in_cmd")
  end
end
return mp.INFECTED
