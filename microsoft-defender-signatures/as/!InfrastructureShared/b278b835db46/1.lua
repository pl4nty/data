-- Threat: !InfrastructureShared
-- Name: b278b835db46
-- Type: 21

if peattributes.no_exports and peattributes.amd64_image and pehdr.NumberOfSections == 6 then
  return mp.INFECTED
end
return mp.CLEAN
