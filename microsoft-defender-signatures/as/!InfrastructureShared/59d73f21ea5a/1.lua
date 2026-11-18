-- Threat: !InfrastructureShared
-- Name: 59d73f21ea5a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil and l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if not l_0_1:match("([^\\]+)$") == "explorer.exe" then
  return mp.CLEAN
end
local l_0_2 = mp.GetScannedPPID()
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
l_0_3 = string.gsub(string.lower(l_0_3), "\\\"|[-;]+(?=s*[\"'])?", "")
local l_0_4 = {"http"}
if not contains(l_0_3, l_0_4) then
  return mp.CLEAN
end
local l_0_5 = {"curl", "minimized"}
if not contains(l_0_3, l_0_5) then
  return mp.CLEAN
end
local l_0_6 = {".txt"}
if not contains(l_0_3, l_0_6) then
  return mp.CLEAN
end
return mp.INFECTED
