-- Threat: !InfrastructureShared
-- Name: add7a78c2923
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1
if IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
  l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if string.find(l_0_1, "delims=", 1, true) and string.find(l_0_1, "for /", 1, true) and string.find(l_0_1, ") do @%", 1, true) then
    return mp.INFECTED
  end
end
local l_0_2 = mp.GetParentProcInfo(l_0_0.ppid)
if l_0_2 == nil or l_0_2.ppid == nil then
  return mp.CLEAN
end
if IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_2.ppid, true) then
  l_0_1 = mp.GetProcessCommandLine(l_0_2.ppid)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  if string.find(l_0_1, "delims=", 1, true) and string.find(l_0_1, "for /", 1, true) and string.find(l_0_1, ") do @%", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
