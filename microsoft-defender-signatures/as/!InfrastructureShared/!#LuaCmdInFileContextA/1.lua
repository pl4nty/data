-- Threat: !InfrastructureShared
-- Name: !#Lua:CmdInFileContext.A
-- Type: 13
-- Includes: TechniqueTracker, Path
-- MpAttributes: Lua:FileInStartupFolder | Lua:FileInsideUserDesktopFolder | Lua:FileInsideAppDataLocalTempFolder | Lua:FileInsideUserDownloadFolder | !RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) ~= true and mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = string.find(l_0_0, "->", 1, true)
if l_0_1 ~= nil then
  l_0_0 = string.sub(l_0_0, 0, l_0_1 - 1)
  if l_0_0 == nil or #l_0_0 < 4 then
    return mp.CLEAN
  end
end
if 20 < #l_0_0 then
  local l_0_2 = string.match(l_0_0, "([^\\%.]+)$")
  l_0_0 = string.sub(l_0_0, 0, 14 + #l_0_2) .. "~1." .. l_0_2
end
local l_0_3 = {
  ["PACKED_WITH:[CMDEmbedded]"] = {
    ["Lua:TopLevelFileExt.A!lnk"] = {
      ["Lua:TopLevelFile.A!FileInStartup"] = {
        "T1547.009:persistence_target",
        "T1547.001:persistence_target",
        "T1547.009:LnkFileInStartup_target",
        "T1547.009:" .. l_0_0
      },
      ["Lua:TopLevelFile.A!FileInUserDesktop"] = {
        "T1204.001:execution_target",
        "T1204.001:LnkFileInDesktop_target",
        "T1204.001:" .. l_0_0
      },
      ["Lua:TopLevelFile.A!FileInAppDataLocalTemp"] = {
        "T1204.001:execution_target",
        "T1204.001:LnkFileInTemp_target",
        "T1204.001:" .. l_0_0
      },
      ["Lua:TopLevelFile.A!FileInUserDownloads"] = {
        "T1204.001:execution_target",
        "T1204.001:LnkFileInDownload_target",
        "T1204.001:" .. l_0_0
      }
    }
  },
  ["RPF:TopLevelFile"] = {
    ["Lua:CMDExt"] = {
      ["Lua:FileInStartupFolder"] = {
        "T1547.001:persistence_target",
        "T1547.001:CmdFileInStartup_target",
        "T1547.001:" .. l_0_0
      },
      ["Lua:FileInsideUserDesktopFolder"] = {
        "T1059.003:execution_target",
        "T1059.003:CmdFileInDesktop_target",
        "T1059.003:" .. l_0_0
      },
      ["Lua:FileInsideAppDataLocalTempFolder"] = {
        "T1059.003:execution_target",
        "T1059.003:CmdFileInTemp_target",
        "T1059.003:" .. l_0_0
      },
      ["Lua:FileInsideUserDownloadFolder"] = {
        "T1059.003:execution_target",
        "T1059.003:CmdFileInDownload_target",
        "T1059.003:" .. l_0_0
      }
    },
    ["Lua:BATExt"] = {
      ["Lua:FileInStartupFolder"] = {
        "T1547.001:persistence_target",
        "T1547.001:BatFileInStartup_target",
        "T1547.001:" .. l_0_0
      },
      ["Lua:FileInsideUserDesktopFolder"] = {
        "T1059.003:execution_target",
        "T1059.003:BatFileInDesktop_target",
        "T1059.003:" .. l_0_0
      },
      ["Lua:FileInsideAppDataLocalTempFolder"] = {
        "T1059.003:execution_target",
        "T1059.003:BatFileInTemp_target",
        "T1059.003:" .. l_0_0
      },
      ["Lua:FileInsideUserDownloadFolder"] = {
        "T1059.003:execution_target",
        "T1059.003:BatFileInDownload_target",
        "T1059.003:" .. l_0_0
      }
    }
  }
}
local l_0_4, l_0_5
for l_0_6, l_0_7 in pairs(l_0_3) do
  if mp.get_mpattribute(l_0_6) then
    l_0_4 = l_0_6
    l_0_5 = l_0_7
    break
  end
end
if l_0_4 == nil or l_0_5 == nil then
  return mp.CLEAN
end
local l_0_8, l_0_9, l_0_10
for l_0_11, l_0_12 in pairs(l_0_5) do
  if mp.get_mpattribute(l_0_11) then
    for l_0_13, l_0_14 in pairs(l_0_12) do
      if mp.get_mpattribute(l_0_13) then
        l_0_8 = l_0_14
        l_0_9 = l_0_11
        l_0_10 = l_0_13
        table.insert(l_0_8, string.format("[%s]=%s", "Lua:CmdInFileContext.A!mpattribute", l_0_11))
        table.insert(l_0_8, string.format("[%s]=%s", "Lua:CmdInFileContext.A!mpattribute", l_0_13))
        break
      end
    end
  end
end
if l_0_8 == nil or l_0_9 == nil or l_0_10 == nil then
  return mp.CLEAN
end
local l_0_15 = tostring(headerpage)
if l_0_15 == nil or #l_0_15 <= 2 then
  return mp.CLEAN
end
local l_0_16 = string.find(l_0_15, "\000", 1, true) - 1
if l_0_16 == nil or l_0_16 <= 2 then
  return mp.CLEAN
end
local l_0_17 = string.lower(string.sub(l_0_15, 1, l_0_16))
if l_0_4 == "RPF:TopLevelFile" and (l_0_9 == "Lua:CMDExt" or l_0_9 == "Lua:BATExt") then
  local l_0_18 = string.find(l_0_17, "\n", 1, true)
  if l_0_18 ~= nil then
    local l_0_19, l_0_20 = string.gsub(l_0_17, "\n", "")
    if 4 <= l_0_20 then
      return mp.CLEAN
    end
    l_0_17 = string.sub(l_0_19, 1, l_0_18 - 1)
    l_0_17 = string.gsub(l_0_17, "\r", "")
  end
end
local l_0_21 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_10 == "Lua:TopLevelFile.A!FileInStartup" or l_0_10 == "Lua:FileInStartupFolder" then
  local l_0_22 = 3689015643
  local l_0_23 = {
    "BM_MT1547.001:persistence"
  }
  local l_0_24 = "BM_MT1547.001:StartupFileTarget.A"
  if l_0_9 == "Lua:TopLevelFileExt.A!lnk" then
    l_0_22 = 4230219827
    l_0_24 = "BM_MT1547.009:StartupLnkFileTarget.A"
    table.insert(l_0_23, "BM_MT1547.009:persistence")
    table.insert(l_0_23, "Lua:LnkFileInStartupWithSuspTarget")
  elseif l_0_9 == "Lua:CMDExt" then
    l_0_22 = 4089264960
    l_0_24 = "BM_MT1547.001:StartupCmdFileTarget.A"
    table.insert(l_0_23, "Lua:CmdFileInStartupWithSuspTarget")
  elseif l_0_9 == "Lua:BATExt" then
    l_0_22 = 3568621407
    l_0_24 = "BM_MT1547.001:StartupBatFileTarget.A"
    table.insert(l_0_23, "Lua:BatFileInStartupWithSuspTarget")
  end
  local l_0_25 = mp.GetExecutablesFromCommandLine(l_0_17)
  for l_0_26, l_0_27 in ipairs(l_0_25) do
    if 3 < #l_0_27 and string.sub(l_0_27, 1, 3) == "..\\" then
      l_0_27 = expandRelativePath(l_0_27, l_0_21)
    end
    l_0_27 = mp.ContextualExpandEnvironmentVariables(l_0_27)
    if isLolbinFile(l_0_27) == false and sysio.IsFileExists(l_0_27) and checkFileLastWriteTime(l_0_27, 21600) == false and mp.IsKnownFriendlyFile(l_0_27, false, false) == false then
      TrackFileAndTechnique(l_0_27, l_0_8)
      TrackFileAndTechnique(l_0_27, l_0_24)
      for l_0_28, l_0_29 in ipairs(l_0_23) do
        mp.set_mpattribute(l_0_29)
      end
      mp.ReportLowfi(l_0_27, l_0_22)
    end
  end
end
if (l_0_10 == "Lua:TopLevelFile.A!FileInStartup" or l_0_10 == "Lua:FileInStartupFolder") and string.sub(l_0_17, 1, 3) == "..\\" then
  l_0_17 = expandRelativePath(l_0_17, l_0_21)
  if l_0_17 == nil then
    return mp.CLEAN
  end
end
local l_0_30 = getCustomStringHash(l_0_17)
if l_0_30 == nil then
  return mp.CLEAN
end
local l_0_31 = "CommandLineCustomHash:" .. l_0_30
local l_0_32 = mp.getfilename()
if l_0_32 ~= nil and 3 < #l_0_32 then
  local l_0_33 = string.find(l_0_32, "->", 1, true)
  if l_0_33 ~= nil and 4 < l_0_33 then
    l_0_32 = string.sub(l_0_32, 0, l_0_33 - 1)
  end
  l_0_32 = normalize_path(l_0_32)
  local l_0_34 = string.format("[%s]=%s", "Lua:CmdInFileContext.A!file", l_0_32)
  table.insert(l_0_8, l_0_34)
end
for l_0_35, l_0_36 in ipairs(l_0_8) do
  if not MpCommon.QueryPersistContextNoPath(l_0_31, l_0_36) then
    MpCommon.AppendPersistContextNoPath(l_0_31, l_0_36, 0)
  end
end
return mp.CLEAN
