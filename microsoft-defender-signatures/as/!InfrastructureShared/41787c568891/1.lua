-- Threat: !InfrastructureShared
-- Name: 41787c568891
-- Type: 21

if peattributes.isexe == true and peattributes.hasexports == true and pesecs[3].Name == ".cdata" and pesecs[3].Characteristics == 3221225536 and mp.getfilesize() >= 10000000 and mp.getfilesize() <= 15000000 then
  return mp.INFECTED
end
return mp.CLEAN
