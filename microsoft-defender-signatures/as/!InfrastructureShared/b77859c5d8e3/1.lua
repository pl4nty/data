-- Threat: !InfrastructureShared
-- Name: b77859c5d8e3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
