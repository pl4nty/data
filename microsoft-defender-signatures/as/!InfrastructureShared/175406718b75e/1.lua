-- Threat: !InfrastructureShared
-- Name: 175406718b75e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
