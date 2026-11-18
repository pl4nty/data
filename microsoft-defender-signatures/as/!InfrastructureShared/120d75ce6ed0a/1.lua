-- Threat: !InfrastructureShared
-- Name: 120d75ce6ed0a
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = false
  local l_0_2
  if l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
    l_0_1 = true
    l_0_2 = l_0_0.ppid
  else
    local l_0_3 = mp.GetParentProcInfo(l_0_0.ppid)
    if l_0_3 ~= nil and l_0_3.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_3.ppid, true) then
      l_0_1 = true
      l_0_2 = l_0_3.ppid
    end
  end
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_4 = mp.GetProcessCommandLine(l_0_2)
  if not l_0_4 then
    return mp.CLEAN
  end
  l_0_4 = string.lower(l_0_4)
  if string.find(l_0_4, "|cmd", 1, true) or string.find(l_0_4, "| cmd", 1, true) or string.find(l_0_4, "|c:\\windows\\system32\\cmd.exe", 1, true) or string.find(l_0_4, "| c:\\windows\\system32\\cmd.exe", 1, true) or string.find(l_0_4, " do call %", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
