-- Threat: !InfrastructureShared
-- Name: 316161488b49
-- Type: 21

local l_0_0 = mp.getfilesize()
if 32768 <= l_0_0 and l_0_0 <= 720896 then
  return mp.INFECTED
end
return mp.CLEAN
