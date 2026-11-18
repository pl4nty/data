-- Threat: !InfrastructureShared
-- Name: 2f293e930cbe
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "%.ipynb$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
