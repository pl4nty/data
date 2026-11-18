-- Threat: !InfrastructureShared
-- Name: adb384f1d1e7
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = GetFileName(l_0_0.image_path)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {
  "wmiprvse.exe",
  "wsmprovhost.exe",
  "winrshost.exe",
  "psexesvc.exe",
  "sshd.exe"
}
if contains(l_0_1, l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN
