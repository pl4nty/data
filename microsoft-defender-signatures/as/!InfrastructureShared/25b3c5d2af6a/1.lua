-- Threat: !InfrastructureShared
-- Name: 25b3c5d2af6a
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = string.lower(l_0_0.command_line)
if string.find(l_0_1, "\\microsoft\\windows defender advanced threat protection\\datacollection\\", 1, true) or string.find(l_0_1, "\\imecache\\", 1, true) then
  return mp.CLEAN
end

function ends_with(l_1_0, l_1_1)
  return l_1_1 == "" or l_1_0:sub(-#l_1_1) == l_1_1
end

function process_injtarget()
  local l_2_0, l_2_1 = bm.get_process_relationships()
  for l_2_2, l_2_3 in ipairs(l_2_1) do
    if l_2_3.reason == bm.RELATIONSHIP_INJECTION then
      local l_2_4 = string.lower(l_2_3.image_path)
      if string.find(l_2_4, "\\windows\\system32\\svchost.exe", 1, true) or string.find(l_2_4, "\\windows\\system32\\lsass.exe", 1, true) or string.find(l_2_4, "\\windows\\system32\\services.exe", 1, true) or string.find(l_2_4, "\\windows\\system32\\winlogon.exe", 1, true) or string.find(l_2_4, "\\windows\\explorer.exe", 1, true) or string.find(l_2_4, "\\windows defender\\", 1, true) then
        return
      else
        bm.add_threat_process(l_2_3.ppid)
      end
    end
  end
end

local l_0_2 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if ends_with(l_0_2, "\\powershell.exe") then
  process_injtarget()
  return mp.INFECTED
end
if ends_with(l_0_2, "\\pwsh.exe") then
  process_injtarget()
  return mp.INFECTED
end
if ends_with(l_0_2, "\\powershell_ise.exe") then
  process_injtarget()
  return mp.INFECTED
end
return mp.CLEAN
