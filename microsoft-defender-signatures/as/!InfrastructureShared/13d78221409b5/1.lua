-- Threat: !InfrastructureShared
-- Name: 13d78221409b5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
