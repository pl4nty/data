-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\99d7ba2c4891\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
l_0_1 = l_0_1:gsub("%^", "")
l_0_1 = l_0_1:gsub("\'", "")
l_0_1 = l_0_1:gsub("%s+", " ")
if ((string.find)(l_0_1, " && mshta ", 1, true) and (string.find)(l_0_1, " && curl ", 1, true)) or (string.find)(l_0_1, " in (curl ", 1, true) and (string.find)(l_0_1, " && echo ", 1, true) then
  local l_0_2 = (mp.GetParentProcInfo)()
  if l_0_2 ~= nil then
    local l_0_3 = (string.lower)(l_0_2.image_path)
    if l_0_3:match("([^\\]+)$") == "explorer.exe" then
      return mp.INFECTED
    end
    if l_0_2.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_2.ppid, true) then
      return mp.INFECTED
    end
    local l_0_4 = (mp.GetParentProcInfo)(l_0_2.ppid)
    if l_0_4 ~= nil and l_0_4.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_4.ppid, true) then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

