-- Threat: !InfrastructureShared
-- Name: 55b31307671b
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(string.lower(l_0_0), "\\program files", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
