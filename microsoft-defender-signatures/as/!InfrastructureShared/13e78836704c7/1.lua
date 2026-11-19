-- Threat: !InfrastructureShared
-- Name: 13e78836704c7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and pehdr.NumberOfSections == 2 then
  return mp.INFECTED
end
return mp.CLEAN
