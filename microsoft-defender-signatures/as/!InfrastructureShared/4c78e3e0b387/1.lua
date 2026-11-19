-- Threat: !InfrastructureShared
-- Name: 4c78e3e0b387
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 95000 then
  return mp.INFECTED
end
return mp.CLEAN
