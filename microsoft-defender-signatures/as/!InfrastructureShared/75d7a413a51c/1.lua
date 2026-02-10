-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\75d7a413a51c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "explorer.exe" or l_0_1:match("([^\\]+)$") == "conhost.exe" then
    return mp.INFECTED
  end
  if l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
    return mp.INFECTED
  end
  local l_0_2 = (mp.GetParentProcInfo)(l_0_0.ppid)
  if l_0_2 ~= nil and l_0_2.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_2.ppid, true) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

