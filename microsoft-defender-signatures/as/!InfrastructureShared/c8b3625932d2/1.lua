-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\c8b3625932d2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
do
  if l_0_1 then
    local l_0_2 = (string.match)(l_0_1, "((%d+)%.(%d+)%.(%d+)%.(%d+))")
    if l_0_2 then
      TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_RemoteDirMount")
      addRelatedProcess()
      reportRelatedBmHits()
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

