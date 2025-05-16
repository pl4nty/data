-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9cb3ee5725ce\0x00000b10_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
do
  if l_0_1 ~= "" and l_0_1 ~= nil then
    local l_0_2 = (string.match)(l_0_1, "//[^%s]+%s([^%s]+)%s")
    if l_0_2 ~= "" and l_0_2 ~= nil and (string.match)(l_0_2, "/%.[^/]+$") then
      TrackPidAndTechniqueBM("BM", "T1564.005", "DefenseEvasion_HideArtifacts_HiddenFileSystem_HiddenMount")
      reportRelatedBmHits()
      addRelatedProcess()
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

