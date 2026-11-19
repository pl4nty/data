-- Threat: !InfrastructureShared
-- Name: be78d8557d8d
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  if string.find(l_0_0, "\\program files", 1, true) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
