-- Threat: !InfrastructureShared
-- Name: 57d71802c1a6
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
if #l_0_1 < 70 then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil and l_0_2.image_path == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
if l_0_3:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
local l_0_4
l_0_4 = {
  "[system.environment]",
  "[system.convert]::frombase64string",
  "Net.WebClient).DownloadString($"
}
if not contains(l_0_1, l_0_4) then
  return mp.CLEAN
end
local l_0_5
l_0_5 = {"hidden"}
if not contains(l_0_1, l_0_5) then
  return mp.CLEAN
end
return mp.INFECTED
