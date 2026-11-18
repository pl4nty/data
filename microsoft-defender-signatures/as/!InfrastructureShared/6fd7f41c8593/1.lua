-- Threat: !InfrastructureShared
-- Name: 6fd7f41c8593
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "wmiprvse.exe" or l_0_1:match("([^\\]+)$") == "mshta.exe" or l_0_1:match("([^\\]+)$") == "rundll32.exe" or l_0_1:match("([^\\]+)$") == "wscript.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
