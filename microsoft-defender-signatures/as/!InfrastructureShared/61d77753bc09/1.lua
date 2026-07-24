-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\61d77753bc09\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and l_0_0.ppid ~= nil then
  local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  l_0_1 = l_0_1:lower()
  l_0_1 = l_0_1:gsub("%^", "")
  l_0_1 = l_0_1:gsub("\'", "")
  l_0_1 = l_0_1:gsub("%s+", " ")
  if (string.find)(l_0_1, "pushd \\\\", 1, true) and (string.find)(l_0_1, "@ssl\\", 1, true) then
    if IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
      return mp.INFECTED
    else
      local l_0_2 = (mp.GetParentProcInfo)(l_0_0.ppid)
      if l_0_2 ~= nil and l_0_2.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_2.ppid, true) then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

