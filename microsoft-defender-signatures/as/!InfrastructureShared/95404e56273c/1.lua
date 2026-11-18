-- Threat: !InfrastructureShared
-- Name: 95404e56273c
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 4096 <= l_0_0 and l_0_0 <= 12288 then
  return mp.INFECTED
end
return mp.CLEAN
