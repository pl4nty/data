-- Threat: !InfrastructureShared
-- Name: 7378b00e1a63
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
