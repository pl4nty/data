-- Threat: !InfrastructureShared
-- Name: 6fd7775cb0c8
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "svchost.exe" then
    if versioning.IsSeville() or versioning.IsServer() then
      return mp.INFECTED
    end
    return mp.LOWFI
  end
end
return mp.CLEAN
