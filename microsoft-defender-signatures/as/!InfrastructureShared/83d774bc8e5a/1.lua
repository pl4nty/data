-- Threat: !InfrastructureShared
-- Name: 83d774bc8e5a
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "services.exe" or l_0_1:match("([^\\]+)$") == "wmiprvse.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
