-- Threat: !InfrastructureShared
-- Name: 2016185b885d1
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
