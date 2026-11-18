-- Threat: !InfrastructureShared
-- Name: 4078c80454d9
-- Type: 21

if peattributes.isexe == true and epcode[1] == 64 then
  return mp.INFECTED
end
return mp.CLEAN
