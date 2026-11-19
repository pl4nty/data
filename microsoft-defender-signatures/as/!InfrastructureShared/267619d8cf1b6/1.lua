-- Threat: !InfrastructureShared
-- Name: 267619d8cf1b6
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
