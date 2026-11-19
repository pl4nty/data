-- Threat: !InfrastructureShared
-- Name: 4e788cda0f6c
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 20000 then
  return mp.INFECTED
end
return mp.CLEAN
