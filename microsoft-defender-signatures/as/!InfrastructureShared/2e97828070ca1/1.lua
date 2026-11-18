-- Threat: !InfrastructureShared
-- Name: 2e97828070ca1
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdriver == true and l_0_0 < 1000000 then
  return mp.INFECTED
end
return mp.CLEAN
