-- Threat: !InfrastructureShared
-- Name: 277fd337ec88
-- Type: 21

if pesecs[pehdr.NumberOfSections].NameDW == 1163217994 and peattributes.epscn_islast == true then
  return mp.INFECTED
end
mp.changedetectionname(805306404)
return mp.INFECTED
