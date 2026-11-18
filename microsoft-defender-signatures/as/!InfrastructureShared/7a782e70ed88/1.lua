-- Threat: !InfrastructureShared
-- Name: 7a782e70ed88
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
