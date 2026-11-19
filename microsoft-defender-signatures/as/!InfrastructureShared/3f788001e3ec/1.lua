-- Threat: !InfrastructureShared
-- Name: 3f788001e3ec
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
