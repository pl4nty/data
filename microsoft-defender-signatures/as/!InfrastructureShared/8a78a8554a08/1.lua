-- Threat: !InfrastructureShared
-- Name: 8a78a8554a08
-- Type: 21

if peattributes.isexe and peattributes.hasstandardentry and pehdr.NumberOfSections >= 5 and pesecs[4].Name == ".rsrc" and pesecs[4].SizeOfRawData >= 86016 then
  return mp.INFECTED
end
return mp.SUSPICIOUS
