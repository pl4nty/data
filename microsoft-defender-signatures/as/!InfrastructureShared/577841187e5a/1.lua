-- Threat: !InfrastructureShared
-- Name: 577841187e5a
-- Type: 21

if peattributes.isexe == true and peattributes.no_security and pehdr.Magic == 267 and pesecs[3].Name == ".rsrc" and pesecs[3].Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN
