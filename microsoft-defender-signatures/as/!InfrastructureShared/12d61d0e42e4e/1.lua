-- Threat: !InfrastructureShared
-- Name: 12d61d0e42e4e
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and l_0_0 < 50112 then
  return mp.INFECTED
end
return mp.CLEAN
