-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\dad7cf30faa9\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if not (string.find)(l_0_1, "& rundll32", 1, true) and not (string.find)(l_0_1, "=rundll32", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 ~= nil then
  local l_0_3 = (string.lower)(l_0_2.image_path)
  if l_0_3:match("([^\\]+)$") == "explorer.exe" or l_0_2.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_2.ppid, true) then
    return mp.INFECTED
  else
    local l_0_4 = (mp.GetProcessCommandLine)(l_0_2.ppid)
    if l_0_4 == nil then
      return mp.CLEAN
    end
    if (string.find)(l_0_4, " --headless ", 1, true) then
      return mp.INFECTED
    end
    local l_0_5 = (mp.GetParentProcInfo)(l_0_2.ppid)
    if l_0_5 ~= nil and l_0_5.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_5.ppid, true) then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

