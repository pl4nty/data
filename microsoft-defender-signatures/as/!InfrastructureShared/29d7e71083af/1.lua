-- Threat: !InfrastructureShared
-- Name: 29d7e71083af
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
if string.lower(string.match(l_0_0.image_path, "\\([^\\]+)$")) ~= "razerinstaller.exe" then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
if l_0_1 == "" or l_0_1 == nil then
  return mp.CLEAN
end
if string.find(string.lower(l_0_1), "razerinstaller%.exe[^/]+/showdevice$") == nil then
  return mp.CLEAN
end
return mp.INFECTED
