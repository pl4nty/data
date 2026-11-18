-- Threat: !InfrastructureShared
-- Name: 6178f3200c19
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
