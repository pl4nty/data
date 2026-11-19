-- Threat: !InfrastructureShared
-- Name: 3e78e28614ca
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
