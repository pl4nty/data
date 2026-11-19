-- Threat: !InfrastructureShared
-- Name: 8dd77aae22cd
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
  local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
  if l_0_1 then
    l_0_1 = string.lower(l_0_1)
    if string.find(l_0_1, "echo binary", 1, true) and string.find(l_0_1, "echo get ", 1, true) then
      return mp.INFECTED
    end
    if string.find(l_0_1, "curl", 1, true) and string.find(l_0_1, "ftp -s:", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
