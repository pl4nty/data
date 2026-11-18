-- Threat: !InfrastructureShared
-- Name: 32617d87e7b5
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.isdll == true and l_0_0 < 1024000 then
  return mp.INFECTED
end
return mp.CLEAN
