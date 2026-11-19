-- Threat: !InfrastructureShared
-- Name: f5787ab29f46
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
