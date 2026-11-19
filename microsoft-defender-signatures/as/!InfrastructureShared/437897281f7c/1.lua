-- Threat: !InfrastructureShared
-- Name: 437897281f7c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
