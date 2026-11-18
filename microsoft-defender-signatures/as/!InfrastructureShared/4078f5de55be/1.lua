-- Threat: !InfrastructureShared
-- Name: 4078f5de55be
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
