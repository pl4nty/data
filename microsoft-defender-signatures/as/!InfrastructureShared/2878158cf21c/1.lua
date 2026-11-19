-- Threat: !InfrastructureShared
-- Name: 2878158cf21c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == false then
  return mp.INFECTED
end
return mp.CLEAN
