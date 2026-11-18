-- Threat: !InfrastructureShared
-- Name: 867800ba96fe
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
