-- Threat: !InfrastructureShared
-- Name: 383b37dadad4d
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
if l_0_1 == nil or string.len(l_0_1) < 900 then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo(l_0_0.ppid)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
if string.find(l_0_3, "\\wmiprvse.exe", 1, true) or string.find(l_0_3, "\\wscript.exe", 1, true) or string.find(l_0_3, "\\winword.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
