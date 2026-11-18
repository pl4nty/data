-- Threat: !InfrastructureShared
-- Name: 80d7dc3010b0
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "explorer.exe" or l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
    return mp.INFECTED
  else
    local l_0_2 = mp.GetParentProcInfo(l_0_0.ppid)
    if l_0_2 ~= nil and l_0_2.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_2.ppid, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
