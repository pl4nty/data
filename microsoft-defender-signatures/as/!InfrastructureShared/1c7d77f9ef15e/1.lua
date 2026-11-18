-- Threat: !InfrastructureShared
-- Name: 1c7d77f9ef15e
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(l_0_0.image_path, -12))
  if l_0_1 == "wmiprvse.exe" or l_0_1 == "services.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
