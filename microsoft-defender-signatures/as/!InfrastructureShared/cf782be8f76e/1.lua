-- Threat: !InfrastructureShared
-- Name: cf782be8f76e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
