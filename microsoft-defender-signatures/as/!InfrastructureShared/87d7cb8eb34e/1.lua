-- Threat: !InfrastructureShared
-- Name: 87d7cb8eb34e
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(l_0_0.image_path, -12))
  if l_0_1 == "wmiprvse.exe" or l_0_1 == "services.exe" then
    return mp.LOWFI
  end
end
return mp.CLEAN
