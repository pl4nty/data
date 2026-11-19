-- Threat: !InfrastructureShared
-- Name: 1b078b6b0dbe4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and pehdr.NumberOfSections == 4 then
  return mp.INFECTED
end
return mp.CLEAN
