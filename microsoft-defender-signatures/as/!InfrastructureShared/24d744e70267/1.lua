-- Threat: !InfrastructureShared
-- Name: 24d744e70267
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "\\windows\\system32\\", 1, true) and (l_0_1:match("([^\\]+)$") == "fodhelper.exe" or l_0_1:match("([^\\]+)$") == "computerdefaults.exe" or l_0_1:match("([^\\]+)$") == "wsreset.exe" or l_0_1:match("([^\\]+)$") == "changepk.exe" or l_0_1:match("([^\\]+)$") == "control.exe") then
    return mp.INFECTED
  end
end
return mp.CLEAN
