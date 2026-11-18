-- Threat: !InfrastructureShared
-- Name: 2078f99c730f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
