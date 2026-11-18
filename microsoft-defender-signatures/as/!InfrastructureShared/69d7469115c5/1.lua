-- Threat: !InfrastructureShared
-- Name: 69d7469115c5
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.ppid and IsKeyInRollingQueue("IsProcessChainViaRUNMRU", l_0_0.ppid, true) then
  local l_0_1 = mp.GetScannedPPID()
  if l_0_1 == "" or l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = mp.GetProcessCommandLine(l_0_1)
  if not l_0_2 then
    return mp.CLEAN
  end
  l_0_2 = string.lower(l_0_2)
  local l_0_3, l_0_4 = extract_urls(l_0_2)
  if isnull(l_0_4) then
    return mp.CLEAN
  end
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    local l_0_7 = split(l_0_6, "%.")
    if not l_0_7 then
      return mp.CLEAN
    end
    local l_0_8 = "." .. tostring(l_0_7[#l_0_7])
    if not l_0_8 then
      return mp.CLEAN
    end
    if isSuspTLD(l_0_8) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
