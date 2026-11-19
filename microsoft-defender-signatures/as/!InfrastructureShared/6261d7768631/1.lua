-- Threat: !InfrastructureShared
-- Name: 6261d7768631
-- Type: 21

if peattributes.no_security == true and pehdr.NumberOfSections > 3 and pehdr.NumberOfSections < 7 and pesecs[4].Name == ".pdata" then
  return mp.INFECTED
end
return mp.LOWFI
