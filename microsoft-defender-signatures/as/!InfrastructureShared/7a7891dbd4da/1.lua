-- Threat: !InfrastructureShared
-- Name: 7a7891dbd4da
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
