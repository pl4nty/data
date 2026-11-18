-- Threat: !InfrastructureShared
-- Name: !#//Lua:LnkExt
-- Type: 12

local l_0_0 = string.lower(string.sub(mp.getfilename(), -4))
if l_0_0 == ".lnk" then
  return mp.INFECTED
end
return mp.CLEAN
