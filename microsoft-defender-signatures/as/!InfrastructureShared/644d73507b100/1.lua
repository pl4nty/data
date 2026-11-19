-- Threat: !InfrastructureShared
-- Name: 644d73507b100
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
local l_0_2 = {
  "mshta",
  "powershell",
  "curl",
  "wmic"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 ~= nil and l_0_3.image_path ~= nil then
  local l_0_4 = string.lower(l_0_3.image_path)
  if l_0_4:match("([^\\]+)$") == "explorer.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
