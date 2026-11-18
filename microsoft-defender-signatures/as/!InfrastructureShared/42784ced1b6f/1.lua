-- Threat: !InfrastructureShared
-- Name: 42784ced1b6f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
