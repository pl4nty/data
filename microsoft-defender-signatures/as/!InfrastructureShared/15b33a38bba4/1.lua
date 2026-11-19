-- Threat: !InfrastructureShared
-- Name: 15b33a38bba4
-- Type: 21
-- Includes: BMLuaLib

if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if not isnull(l_0_0) and not isnull(l_0_0.command_line) then
  local l_0_1 = string.lower(l_0_0.command_line)
  if string.find(l_0_1, "svchost.exe -k camera -s frameserver", 1, true) then
    return mp.CLEAN
  end
end
local l_0_2 = string.lower(bm.get_imagepath())
if l_0_2 then
  if string.find(l_0_2, "\\python", 1, true) then
    return mp.INFECTED
  end
  if string.find(l_0_2, "\\program files", 1, true) or string.find(l_0_2, "\\microsoft vs code\\", 1, true) or string.find(l_0_2, "microsoft.watson", 1, true) or string.find(l_0_2, "mpsigstub.exe", 1, true) or string.find(l_0_2, "\\te.exe", 1, true) or string.find(l_0_2, "\\te.processhost.exe", 1, true) or string.find(l_0_2, "virtualboxvm.exe", 1, true) or string.find(l_0_2, "\\svcfab\\_app\\", 1, true) or string.find(l_0_2, "\\fennec-windows", 1, true) or string.find(l_0_2, "\\mpscan.exe", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
