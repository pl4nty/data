-- Threat: !InfrastructureShared
-- Name: 70788a4e97c8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
