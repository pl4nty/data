-- Threat: !InfrastructureShared
-- Name: 81784123233a
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
