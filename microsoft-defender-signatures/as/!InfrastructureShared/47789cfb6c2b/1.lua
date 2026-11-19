-- Threat: !InfrastructureShared
-- Name: 47789cfb6c2b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
