-- Threat: !InfrastructureShared
-- Name: 47782493bdae
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll == true and l_0_0 < 409600 then
  return mp.INFECTED
end
return mp.CLEAN
