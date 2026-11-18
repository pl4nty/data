-- Threat: !InfrastructureShared
-- Name: 2b7885f6054c
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() > 40000 and mp.getfilesize() < 50000 then
  return mp.INFECTED
end
return mp.CLEAN
