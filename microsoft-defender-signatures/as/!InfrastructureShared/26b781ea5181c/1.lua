-- Threat: !InfrastructureShared
-- Name: 26b781ea5181c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
