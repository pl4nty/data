-- Threat: !InfrastructureShared
-- Name: 49781adc12f3
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 1500000 then
  return mp.INFECTED
end
return mp.CLEAN
