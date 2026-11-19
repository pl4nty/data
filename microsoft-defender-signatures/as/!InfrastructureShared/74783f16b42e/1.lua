-- Threat: !InfrastructureShared
-- Name: 74783f16b42e
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and pehdr.NumberOfSections == 3 then
  return mp.INFECTED
end
return mp.CLEAN
