-- Threat: !InfrastructureShared
-- Name: 76784c658e69
-- Type: 21

if peattributes.isexe and pehdr.ImageBase == 675807232 then
  return mp.INFECTED
end
return mp.CLEAN
