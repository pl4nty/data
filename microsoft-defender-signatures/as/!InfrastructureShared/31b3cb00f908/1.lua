-- Threat: !InfrastructureShared
-- Name: 31b3cb00f908
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "\\program files", 1, true) ~= nil and string.find(l_0_0, "\\malwarebytes", 1, true) ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
