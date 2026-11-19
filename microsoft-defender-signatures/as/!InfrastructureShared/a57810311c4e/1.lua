-- Threat: !InfrastructureShared
-- Name: a57810311c4e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
