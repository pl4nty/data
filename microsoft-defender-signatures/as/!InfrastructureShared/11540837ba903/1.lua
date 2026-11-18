-- Threat: !InfrastructureShared
-- Name: 11540837ba903
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
