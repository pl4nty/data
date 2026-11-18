-- Threat: !InfrastructureShared
-- Name: 79787d7fb50e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
