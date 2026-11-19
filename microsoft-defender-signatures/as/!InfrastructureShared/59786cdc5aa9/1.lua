-- Threat: !InfrastructureShared
-- Name: 59786cdc5aa9
-- Type: 21

if peattributes.no_security == true and peattributes.isexe and pesecs[10].Name == ".themida" and mp.getfilesize() > 6100000 and mp.getfilesize() < 6750000 then
  return mp.INFECTED
end
return mp.CLEAN
