-- Threat: !InfrastructureShared
-- Name: 4d78a89c201f
-- Type: 21

if (peattributes.isexe == true or peattributes.ismsil == true) and pehdr.SizeOfImage >= 57344 and pehdr.Subsystem == 2 then
  return mp.INFECTED
end
return mp.CLEAN
