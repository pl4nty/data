-- Threat: !InfrastructureShared
-- Name: 1f782d225fb7
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 675840 then
  return mp.INFECTED
end
return mp.CLEAN
