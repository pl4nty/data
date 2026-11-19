-- Threat: !InfrastructureShared
-- Name: 6778970662bd
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and pesecs[6].Name == ".symtab" and pesecs[3].Characteristics == 3221225536 and pesecs[4].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
