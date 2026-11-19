-- Threat: !InfrastructureShared
-- Name: 25b3243fdb10
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\powershell.exe", 1, true) or string.find(l_0_0, "rundll32", 1, true) or string.find(l_0_0, "\\wscript.exe", 1, true) or string.find(l_0_0, "\\cscript.exe", 1, true) or string.find(l_0_0, "\\mshta", 1, true) then
  local l_0_1, l_0_2 = pcall(bm.get_current_process_startup_info)
  if l_0_1 and l_0_2 ~= nil then
    local l_0_3 = l_0_2.ppid
    if MpCommon.QueryPersistContextNoPath("amsidetct", l_0_3) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
