-- Threat: !InfrastructureShared
-- Name: 9778f021a271
-- Type: 21

if peattributes.isexe and pesecs[8].Name == ".rsrc" and pesecs[8].SizeOfRawData > 2228224 and pesecs[8].SizeOfRawData < 2293760 then
  return mp.INFECTED
end
return mp.CLEAN
