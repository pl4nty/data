-- Threat: !InfrastructureShared
-- Name: !#Lua:TriggerTaskResourceScan.B
-- Type: 13
-- Includes: TechniqueTracker, LuaFuncHelper, Path
-- MpAttributes: MpOnModifiedCloseRtpScan & MpUnicodeToAnsiConvertedVfo & BM_SCHEDULEDTASK_JOBFILE & !Lua:FileInZip

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_0 ~= nil and 5 < #l_0_0 then
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = "|explorer.exe|"
  if l_0_1:find(l_0_0) then
    return mp.CLEAN
  end
end
local l_0_2 = tostring(headerpage)
local l_0_3 = string.match(l_0_2, "<Exec>.*<Command>(.*)</Command>.*</Exec>")
if l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_2, "<Exec>.*<WorkingDirectory>(.*)</WorkingDirectory>.*</Exec>")
if l_0_4 ~= nil and l_0_4:sub(-1) ~= "\\" then
  l_0_4 = l_0_4 .. "\\"
end
local l_0_5 = l_0_3
local l_0_6 = string.match(l_0_2, "<Exec>.*<Arguments>(.*)</Arguments>.*</Exec>")
if l_0_6 ~= nil then
  l_0_5 = l_0_5 .. " " .. l_0_6
end
if isCommonScheduledTaskCommand(l_0_5) == true then
  return mp.CLEAN
end
mp.vfo_add_buffer(l_0_5, "[TaskCommand]", 0)
local l_0_7 = {}
table.insert(l_0_7, l_0_5)
MpCommon.SetPersistContextNoPath("Lua:SchedTaskCommand", l_0_7, 100)
TrackCommandLineAndTechnique(l_0_5, "T1053.005:schtask_target")
TrackCommandLineAndTechnique(l_0_5, "LuaTriggerTaskResourceScanB")
if l_0_4 ~= nil then
  TrackCommandLineAndTechnique(l_0_4 .. l_0_5, "T1053.005:schtask_target")
else
  TrackCommandLineAndTechnique("c:\\windows\\system32\\" .. l_0_5, "T1053.005:schtask_target")
  TrackCommandLineAndTechnique("c:\\windows\\" .. l_0_5, "T1053.005:schtask_target")
end
local l_0_8, l_0_9 = getCommandLineType(l_0_5)
local l_0_10 = get_filepaths_from_string(l_0_5, l_0_4)
for l_0_11, l_0_12 in ipairs(l_0_10) do
  local l_0_13 = normalize_path(l_0_12)
  if string.find(l_0_13, "windows\\ccmcache\\", 1, true) or string.find(l_0_13, "\\sysvol\\", 1, true) or string.find(l_0_13, "\\netlogon\\", 1, true) or string.find(l_0_13, "\\support10$\\", 1, true) or string.find(l_0_13, "\\program files", 1, true) or string.find(l_0_13, "\\windows\\", 1, true) then
    return mp.CLEAN
  end
  if StringStartsWith(l_0_13, "\\\\") then
    return mp.CLEAN
  end
  if isCommonScheduledTaskFile(l_0_13) == true then
    return mp.CLEAN
  end
  if sysio.IsFileExists(l_0_12) then
    local l_0_14, l_0_15 = pcall(mp.IsKnownFriendlyFile, l_0_12, false, false)
    if l_0_14 then
      if l_0_15 then
        mp.ReportLowfi(l_0_12, 2557680683)
      else
        local l_0_16 = false
        if l_0_8 ~= nil then
          if l_0_8 == "nodejs" then
            mp.ReportLowfi(l_0_12, 4099585109)
            l_0_16 = true
          elseif l_0_8 == "wsh" then
            mp.ReportLowfi(l_0_12, 3351996639)
            l_0_16 = true
          elseif l_0_8 == "downloader" then
            mp.ReportLowfi(l_0_12, 983383434)
            l_0_16 = true
          elseif l_0_8 == "dll_loader" then
            mp.ReportLowfi(l_0_12, 752190164)
            l_0_16 = true
          elseif l_0_9 == "script" then
            mp.ReportLowfi(l_0_12, 3703821902)
            l_0_16 = true
          elseif l_0_8 == "cmd" then
            mp.ReportLowfi(l_0_12, 18026631)
            l_0_16 = true
          end
        end
        if l_0_16 == false then
          mp.ReportLowfi(l_0_12, 3998179614)
        end
        AppendToRollingQueue("ScheduledTaskRelatedFileA", l_0_12, l_0_5)
      end
    end
    local l_0_17 = MpCommon.QueryPersistContext(l_0_12, "SuspPathsFromSchTask")
    if not l_0_17 then
      MpCommon.AppendPersistContext(l_0_12, "SuspPathsFromSchTask", 3600)
    end
  end
end
return mp.INFECTED
