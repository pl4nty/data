-- Threat: !InfrastructureShared
-- Name: 267808f5aa34
-- Type: 21

if peattributes.x86_image and pesecs[pehdr.NumberOfSections].Name == "Zero" then
  return mp.INFECTED
end
return mp.CLEAN
