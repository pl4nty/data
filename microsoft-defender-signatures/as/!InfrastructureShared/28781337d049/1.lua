-- Threat: !InfrastructureShared
-- Name: 28781337d049
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
