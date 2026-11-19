-- Threat: !InfrastructureShared
-- Name: 15dd7a17d75c3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 ~= nil then
  local l_0_2 = {"curl"}
  if not contains(l_0_1, l_0_2) then
    return mp.CLEAN
  end
  local l_0_3 = {"bash", "xattr"}
  if not contains(l_0_1, l_0_3) then
    return mp.CLEAN
  end
end
return mp.INFECTED
