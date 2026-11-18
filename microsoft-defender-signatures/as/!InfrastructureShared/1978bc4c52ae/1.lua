-- Threat: !InfrastructureShared
-- Name: 1978bc4c52ae
-- Type: 21

if peattributes.isexe == true and pesecs[9].Name == ".tls" and pesecs[9].Characteristics == 3221225536 and mp.getfilesize() >= 1000000 and mp.getfilesize() <= 3000000 then
  return mp.INFECTED
end
return mp.CLEAN
