-- Threat: !InfrastructureShared
-- Name: 13b78bb6c81ad
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 200000 then
  return mp.INFECTED
end
return mp.CLEAN
