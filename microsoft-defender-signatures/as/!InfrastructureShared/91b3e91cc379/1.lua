-- Threat: !InfrastructureShared
-- Name: 91b3e91cc379
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 then
  if string.find(string.lower(l_0_0), "\\opera software\\", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
