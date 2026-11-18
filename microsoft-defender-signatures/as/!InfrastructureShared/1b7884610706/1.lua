-- Threat: !InfrastructureShared
-- Name: 1b7884610706
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
