-- Threat: !InfrastructureShared
-- Name: 8178c38db4b3
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and pehdr.NumberOfSections == 7 then
  return mp.INFECTED
end
return mp.CLEAN
