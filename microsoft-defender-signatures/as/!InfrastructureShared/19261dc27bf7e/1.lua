-- Threat: !InfrastructureShared
-- Name: 19261dc27bf7e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
