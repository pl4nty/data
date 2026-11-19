-- Threat: !InfrastructureShared
-- Name: 497831aba653
-- Type: 21

if peattributes.amd64_image and pesecs[pehdr.NumberOfSections - 1].Characteristics == 3221225472 then
  return mp.INFECTED
end
return mp.CLEAN
