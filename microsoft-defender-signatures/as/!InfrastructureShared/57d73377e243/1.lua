-- Threat: !InfrastructureShared
-- Name: 57d73377e243
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = l_0_0.image_path:lower()
  if string.find(l_0_1, "\\program files", 1, true) == nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
