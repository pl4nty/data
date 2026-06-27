-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43b341318b48\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
local l_0_2 = ""
if l_0_0.command_line ~= nil then
  l_0_2 = (string.lower)(l_0_0.command_line)
end
do
  if (string.find)(l_0_1, "\\node.exe", 1, true) then
    local l_0_3, l_0_4, l_0_5 = (string.find)(l_0_2, "openclaw", 1, true)
  end
  -- DECOMPILER ERROR at PC43: Confused about usage of register: R3 in 'UnsetPending'

  if not l_0_3 then
    return mp.CLEAN
  end
  TrackPidAndTechniqueBM("BM", "T1071.001", "rogueclaw_mcp_channel")
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end

