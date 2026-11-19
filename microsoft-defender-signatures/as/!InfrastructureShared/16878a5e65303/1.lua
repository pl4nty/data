-- Threat: !InfrastructureShared
-- Name: 16878a5e65303
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and pehdr.NumberOfSections == 4 then
  return mp.INFECTED
end
return mp.CLEAN
