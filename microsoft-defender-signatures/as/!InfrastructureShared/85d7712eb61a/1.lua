-- Threat: !InfrastructureShared
-- Name: 85d7712eb61a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) then
  local l_0_1 = string.lower(string.sub(l_0_0.image_path, -11))
  if l_0_1 == "svchost.exe" or l_0_1 == "dllhost.exe" then
    return mp.INFECTED
  end
end
return mp.CLEAN
