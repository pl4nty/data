-- Threat: !InfrastructureShared
-- Name: 7778ba80eb6c
-- Type: 21

if peattributes.isexe == true and pehdr.Magic == 523 then
  return mp.INFECTED
end
return mp.CLEAN
