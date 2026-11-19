-- Threat: !InfrastructureShared
-- Name: 767817d41793
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
