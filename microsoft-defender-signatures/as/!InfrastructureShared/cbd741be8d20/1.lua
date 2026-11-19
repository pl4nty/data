-- Threat: !InfrastructureShared
-- Name: cbd741be8d20
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if string.find(l_0_1, "\\windows\\system32\\", 1, true) and l_0_1:match("([^\\]+)$") == "dllhost.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
