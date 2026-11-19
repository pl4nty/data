-- Threat: !InfrastructureShared
-- Name: 3e783c3f331a
-- Type: 21

if peattributes.isexe == true and epcode[1] == 144 then
  return mp.INFECTED
end
return mp.CLEAN
