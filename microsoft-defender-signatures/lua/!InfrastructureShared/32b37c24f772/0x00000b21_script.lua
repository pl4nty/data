-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b37c24f772\0x00000b21_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (mp.GetExecutablesFromCommandLine)(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
for l_0_6,l_0_7 in ipairs(l_0_2) do
  if l_0_7 and (sysio.IsFileExists)(l_0_7) and isTainted(l_0_7, "remote_file_created_taint") then
    addRelatedProcess()
    reportRelatedBmHits()
    TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_RemoteMountedScriptExecution")
    return mp.INFECTED
  end
end
return mp.CLEAN

