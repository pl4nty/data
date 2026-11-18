-- Threat: !InfrastructureShared
-- Name: 58d70c24de7e
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
  l_0_4 = string.gsub(l_0_4, "%^", "")
  if string.find(l_0_4, "&& curl", 1, true) and string.find(l_0_4, "&& tar.exe -xf", 1, true) and string.find(l_0_4, "/c mkdir", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
