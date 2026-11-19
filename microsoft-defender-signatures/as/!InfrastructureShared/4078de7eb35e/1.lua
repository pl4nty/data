-- Threat: !InfrastructureShared
-- Name: 4078de7eb35e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
