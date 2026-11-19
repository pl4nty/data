-- Threat: !InfrastructureShared
-- Name: 4c7816989c1c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
