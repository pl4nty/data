-- Threat: !InfrastructureShared
-- Name: 1f4619914f392
-- Type: 21

if peattributes.ismsil == true and pehdr.NumberOfSections == 5 then
  return mp.INFECTED
end
return mp.CLEAN
