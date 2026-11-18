-- Threat: !InfrastructureShared
-- Name: 175782e7ca979
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll == true and l_0_0 < 204800 then
  return mp.INFECTED
end
return mp.CLEAN
