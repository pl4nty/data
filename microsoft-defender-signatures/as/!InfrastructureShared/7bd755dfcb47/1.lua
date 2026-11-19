-- Threat: !InfrastructureShared
-- Name: 7bd755dfcb47
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if not contains(l_0_1, {
    "program files"
  }) then
    return mp.INFECTED
  end
end
return mp.CLEAN
