-- Threat: !InfrastructureShared
-- Name: 24612961a256
-- Type: 21

local l_0_0 = mp.getfilesize()
if peattributes.hasexports == true and 100000 <= l_0_0 and l_0_0 <= 300000 then
  return mp.INFECTED
end
return mp.CLEAN
