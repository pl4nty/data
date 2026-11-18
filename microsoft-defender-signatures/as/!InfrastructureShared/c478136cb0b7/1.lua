-- Threat: !InfrastructureShared
-- Name: c478136cb0b7
-- Type: 21

if peattributes.isdll == true and peattributes.amd64_image and pehdr.NumberOfSections == 10 then
  return mp.INFECTED
end
return mp.CLEAN
