-- Threat: !InfrastructureShared
-- Name: 5fd7f8bdf4a5
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if type(l_0_0) ~= "string" or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if type(l_0_1) ~= "string" or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
local l_0_2, l_0_3 = string.match(l_0_1, "^%s*\"([^\"]+)\"%s+(.*)$")
if l_0_2 == nil then
  l_0_2, l_0_3 = string.match(l_0_1, "^%s*([^%s\"]+)%s+(.*)$")
end
if l_0_2 == nil or l_0_3 == nil then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_2, "([^\\\\]+)$")
if l_0_4 ~= "cmd.exe" then
  return mp.CLEAN
end
if not string.find(l_0_3, "\\classes\\typelib\\", 1, true) then
  return mp.CLEAN
end
local l_0_5 = string.find(l_0_3, "%f[%w]reg%s+delete%f[%W]") or string.find(l_0_3, "%f[%w]reg%.exe\"?%s+delete%f[%W]")
local l_0_6 = string.find(l_0_3, "%f[%w]reg%s+add%f[%W]") or string.find(l_0_3, "%f[%w]reg%.exe\"?%s+add%f[%W]")
if not l_0_5 or not l_0_6 then
  return mp.CLEAN
end
if not (string.find(l_0_3, "%f[%w]start%f[%W]") and string.find(l_0_3, "%f[%w]explorer%f[%W]")) or not string.find(l_0_3, "%f[%w]shell%f[%W]") then
  return mp.CLEAN
end
local l_0_7 = mp.GetParentProcInfo()
if type(l_0_7) ~= "table" or type(l_0_7.image_path) ~= "string" then
  return mp.CLEAN
end
local l_0_8 = string.match(string.lower(l_0_7.image_path), "([^\\\\]+)$")
if l_0_8 ~= "explorer.exe" then
  return mp.CLEAN
end
return mp.INFECTED
