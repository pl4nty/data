-- Threat: !InfrastructureShared
-- Name: 4278d1ba71ed
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
