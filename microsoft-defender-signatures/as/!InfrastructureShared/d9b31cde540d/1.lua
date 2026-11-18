-- Threat: !InfrastructureShared
-- Name: d9b31cde540d
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 == nil or #l_0_0 < 1 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_0), "\\program files", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
