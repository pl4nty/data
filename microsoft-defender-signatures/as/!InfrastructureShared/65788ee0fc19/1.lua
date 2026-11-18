-- Threat: !InfrastructureShared
-- Name: 65788ee0fc19
-- Type: 21

if peattributes.isexe == true and pehdr.Magic == 267 and pesecs[5].Name == ".rsrc" and pesecs[5].Characteristics == 1073741888 then
  return mp.INFECTED
end
return mp.CLEAN
