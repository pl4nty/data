-- Threat: !InfrastructureShared
-- Name: 1bcd72ddeea09
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) then
  local l_0_1 = string.lower(l_0_0.image_path or "")
  if string.find(l_0_1, "\\windows\\system32\\", 1, true) and (l_0_1:match("([^\\]+)$") == "fodhelper.exe" or l_0_1:match("([^\\]+)$") == "computerdefaults.exe" or l_0_1:match("([^\\]+)$") == "wsreset.exe" or l_0_1:match("([^\\]+)$") == "slui.exe" or l_0_1:match("([^\\]+)$") == "changepk.exe" or l_0_1:match("([^\\]+)$") == "control.exe" or l_0_1:match("([^\\]+)$") == "compmgmtlauncher.exe") then
    return mp.INFECTED
  end
end
return mp.CLEAN
