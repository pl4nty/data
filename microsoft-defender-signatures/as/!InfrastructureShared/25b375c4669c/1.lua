-- Threat: !InfrastructureShared
-- Name: 25b375c4669c
-- Type: 21

function ends_with(l_1_0, l_1_1)
  return l_1_1 == "" or l_1_0:sub(-#l_1_1) == l_1_1
end

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "\\microsoft\\windows defender advanced threat protection\\datacollection\\", 1, true) or string.find(l_0_1, "\\imecache\\", 1, true) then
  return mp.CLEAN
end
local l_0_2 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if ends_with(l_0_2, "\\powershell.exe") then
  return mp.INFECTED
end
if ends_with(l_0_2, "\\pwsh.exe") then
  return mp.INFECTED
end
if ends_with(l_0_2, "\\powershell_ise.exe") then
  return mp.INFECTED
end
return mp.CLEAN
