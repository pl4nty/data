-- Threat: !InfrastructureShared
-- Name: 15a78a27fb1e8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
