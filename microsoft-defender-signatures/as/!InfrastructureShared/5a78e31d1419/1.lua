-- Threat: !InfrastructureShared
-- Name: 5a78e31d1419
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
