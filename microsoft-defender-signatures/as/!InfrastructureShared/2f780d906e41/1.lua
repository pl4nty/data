-- Threat: !InfrastructureShared
-- Name: 2f780d906e41
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
