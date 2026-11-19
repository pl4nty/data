-- Threat: !InfrastructureShared
-- Name: !#//Lua:ISOExt
-- Type: 12

local l_0_0 = string.lower(string.sub(mp.getfilename(), -4))
if l_0_0 == ".iso" or l_0_0 == ".img" then
  return mp.INFECTED
end
return mp.CLEAN
