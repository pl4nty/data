-- Threat: !InfrastructureShared
-- Name: 647882e52b44
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
