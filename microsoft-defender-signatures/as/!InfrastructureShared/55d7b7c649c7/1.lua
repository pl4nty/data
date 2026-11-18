-- Threat: !InfrastructureShared
-- Name: 55d7b7c649c7
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.image_path)
if l_0_1:match("([^\\]+)$") ~= "cmd.exe" and l_0_1:match("([^\\]+)$") ~= "powershell.exe" then
  return mp.INFECTED
end
return mp.CLEAN
