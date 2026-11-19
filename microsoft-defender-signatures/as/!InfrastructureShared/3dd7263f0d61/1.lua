-- Threat: !InfrastructureShared
-- Name: 3dd7263f0d61
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = {
  " iex",
  "invoke-expression",
  "iwr",
  "invoke-webrequest"
}
if not contains(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 ~= nil then
  local l_0_4 = string.lower(l_0_3.image_path)
  if l_0_4:match("([^\\]+)$") == "node.exe" or l_0_4:match("([^\\]+)$") == "npm.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
