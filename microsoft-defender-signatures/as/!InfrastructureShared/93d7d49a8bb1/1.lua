-- Threat: !InfrastructureShared
-- Name: 93d7d49a8bb1
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 ~= nil then
  l_0_1 = string.lower(l_0_1)
end
if not contains(l_0_1, "ownlifeforyouwithme.com/") then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 ~= nil and l_0_2.image_path ~= nil then
  local l_0_3 = string.lower(l_0_2.image_path)
  if l_0_3:match("([^\\]+)$") == "explorer.exe" then
    return mp.INFECTED
  end
end
return mp.LOWFI
