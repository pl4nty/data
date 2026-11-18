-- Threat: !InfrastructureShared
-- Name: 1a788f8a431a
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image and pesecs[3].Name == ".pdata" and pesecs[4].Name == ".idata" and pesecs[5].Name == "INIT" then
  return mp.INFECTED
end
return mp.CLEAN
