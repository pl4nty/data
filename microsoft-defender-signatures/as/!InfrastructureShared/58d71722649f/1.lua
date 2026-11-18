-- Threat: !InfrastructureShared
-- Name: 58d71722649f
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if string.find(l_0_1, "=rundll32", 1, true) and string.find(l_0_1, "=pushd", 1, true) and string.find(l_0_1, " \\\\", 1, true) then
  local l_0_2 = mp.GetParentProcInfo()
  if l_0_2 ~= nil then
    local l_0_3 = string.lower(l_0_2.image_path)
    if l_0_3:match("([^\\]+)$") == "explorer.exe" or l_0_2.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_2.ppid, true) then
      return mp.INFECTED
    else
      local l_0_4 = mp.GetParentProcInfo(l_0_2.ppid)
      if l_0_4 ~= nil and l_0_4.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_4.ppid, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
