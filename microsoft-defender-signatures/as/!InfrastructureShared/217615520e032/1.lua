-- Threat: !InfrastructureShared
-- Name: 217615520e032
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
