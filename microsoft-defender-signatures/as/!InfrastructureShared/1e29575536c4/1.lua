-- Threat: !InfrastructureShared
-- Name: 1e29575536c4
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->(pdf", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
