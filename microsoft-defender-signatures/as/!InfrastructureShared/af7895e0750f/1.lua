-- Threat: !InfrastructureShared
-- Name: af7895e0750f
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.no_security == true and 245760 <= l_0_0 and l_0_0 <= 311296 then
  return mp.INFECTED
end
return mp.CLEAN
