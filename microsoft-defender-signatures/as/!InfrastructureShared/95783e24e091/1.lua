-- Threat: !InfrastructureShared
-- Name: 95783e24e091
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
