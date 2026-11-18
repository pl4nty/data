-- Threat: !InfrastructureShared
-- Name: 5fd7a6938b70
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "mmc.exe" or l_0_1:match("([^\\]+)$") == "wmiprvse.exe" then
    if versioning.IsSeville() or versioning.IsServer() then
      return mp.INFECTED
    end
    return mp.LOWFI
  end
end
return mp.CLEAN
