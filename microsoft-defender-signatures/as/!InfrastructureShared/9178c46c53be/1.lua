-- Threat: !InfrastructureShared
-- Name: 9178c46c53be
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("Lua:RData.GetAPIs") and mp.getfilesize() >= 10000000 then
  return mp.INFECTED
end
return mp.CLEAN
