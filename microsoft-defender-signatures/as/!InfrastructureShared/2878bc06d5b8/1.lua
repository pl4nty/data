-- Threat: !InfrastructureShared
-- Name: 2878bc06d5b8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
