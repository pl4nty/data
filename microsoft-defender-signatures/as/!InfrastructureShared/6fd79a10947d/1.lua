-- Threat: !InfrastructureShared
-- Name: 6fd79a10947d
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(string.sub(l_0_0.image_path, -11))
  if l_0_1 == "svchost.exe" then
    return mp.LOWFI
  end
end
return mp.CLEAN
