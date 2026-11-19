-- Threat: !InfrastructureShared
-- Name: 3978b4331ba3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
