-- Threat: !InfrastructureShared
-- Name: 128b32051778f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.ppid ~= nil and (string.find(l_0_0.ppid, "pid:4$", 1, false) ~= nil or string.find(l_0_0.ppid, "pid:4,", 1, true) ~= nil) then
  return mp.INFECTED
end
local l_0_1 = mp.GetParentProcInfo()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = GetFileName(l_0_1.image_path)
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
local l_0_3 = {
  "wmiprvse.exe",
  "wsmprovhost.exe",
  "winrshost.exe",
  "psexesvc.exe",
  "sshd.exe"
}
if contains(l_0_2, l_0_3) then
  return mp.INFECTED
end
return mp.CLEAN
