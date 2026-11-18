-- Threat: !InfrastructureShared
-- Name: 78783a345e16
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
