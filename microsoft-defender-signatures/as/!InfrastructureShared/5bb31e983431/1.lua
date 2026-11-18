-- Threat: !InfrastructureShared
-- Name: 5bb31e983431
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0 = ""
local l_0_1 = ""
local l_0_2 = ""
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].utf8p1
  if l_0_1 ~= nil then
    l_0_0 = l_0_1:match("(.+[//])")
    l_0_2 = l_0_1
  end
elseif this_sigattrlog[2].matched then
  local l_0_3 = bm.get_current_process_startup_info()
  local l_0_4 = l_0_3.command_line
  if l_0_4 then
    local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_4)
    if l_0_5 == nil then
      return mp.CLEAN
    end
    for l_0_6, l_0_7 in ipairs(l_0_5) do
      if l_0_7 ~= nil and sysio.IsFileExists(l_0_7) and string.sub(l_0_7, 1, 5) == "/mnt/" then
        l_0_0 = l_0_7:match("(.+[//])")
        l_0_2 = l_0_7
      end
    end
  end
end
if l_0_0 == nil or l_0_0 == "" or l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
taint(l_0_2, "mounted_file_execution", 3600)
local l_0_8 = "queue_remotedir_mount"
local l_0_9 = "dir_name"
if sysio.IsFolderExists(l_0_0) then
  local l_0_10 = GetRollingQueueKeyValues(l_0_8, l_0_9)
  if l_0_10 then
    for l_0_11, l_0_12 in ipairs(l_0_10) do
      if l_0_12 and string.sub(l_0_0, 1, string.len(l_0_12.value)) == l_0_12.value then
        taint(l_0_2, "remote_file_created_taint", 3600)
        bm.trigger_sig("RemoteFileCopy", l_0_2)
        if this_sigattrlog[1].matched then
          bm.trigger_sig("Behavior:Linux/RemoteFileExecution.AL", l_0_2)
        elseif this_sigattrlog[2].matched then
          bm.trigger_sig("Behavior:Linux/RemoteMountedScriptExecution.AL", l_0_2)
        end
        addRelatedProcess()
        reportRelatedBmHits()
        TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_RemoteMountedFileExecution")
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
