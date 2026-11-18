-- Threat: !InfrastructureShared
-- Name: 30b3da0e6804
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "program files\\mcafee", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
