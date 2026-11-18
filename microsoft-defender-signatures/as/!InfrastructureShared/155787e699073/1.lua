-- Threat: !InfrastructureShared
-- Name: 155787e699073
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
