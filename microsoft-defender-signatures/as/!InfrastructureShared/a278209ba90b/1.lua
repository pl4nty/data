-- Threat: !InfrastructureShared
-- Name: a278209ba90b
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() == 36864 then
  return mp.INFECTED
end
return mp.CLEAN
