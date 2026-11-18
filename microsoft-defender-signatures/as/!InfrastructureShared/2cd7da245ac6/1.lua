-- Threat: !InfrastructureShared
-- Name: 2cd7da245ac6
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
l_0_1 = l_0_1:gsub("%^", "")
l_0_1 = l_0_1:gsub("'", "")
l_0_1 = l_0_1:gsub("%s+", " ")
if (string.find(l_0_1, " in (curl", 1, true) or string.find(l_0_1, " in (finger", 1, true) or string.find(l_0_1, ") do curl ", 1, true)) and (string.find(l_0_1, ") do call %", 1, true) or string.find(l_0_1, ") do %", 1, true) or string.find(l_0_1, ") do @cmd", 1, true) or string.find(l_0_1, " && mshta ", 1, true)) then
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
