-- Threat: !InfrastructureShared
-- Name: 3278e79f1296
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
