-- Threat: !InfrastructureShared
-- Name: 6778d861eb6f
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image == true and mp.getfilesize() > 20000000 and pesecs[8].Name == ".tls" and pesecs[8].Characteristics == 3221225536 then
  return mp.INFECTED
end
return mp.CLEAN
