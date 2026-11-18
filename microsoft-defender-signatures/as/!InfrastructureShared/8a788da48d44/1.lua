-- Threat: !InfrastructureShared
-- Name: 8a788da48d44
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
