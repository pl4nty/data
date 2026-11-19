-- Threat: !InfrastructureShared
-- Name: 3a78279782c4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
