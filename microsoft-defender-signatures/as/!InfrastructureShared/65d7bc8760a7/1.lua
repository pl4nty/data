-- Threat: !InfrastructureShared
-- Name: 65d7bc8760a7
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "wmiprvse.exe" and versioning.IsSeville() then
    return mp.LOWFI
  end
end
return mp.CLEAN
