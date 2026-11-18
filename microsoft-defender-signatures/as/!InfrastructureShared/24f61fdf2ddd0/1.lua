-- Threat: !InfrastructureShared
-- Name: 24f61fdf2ddd0
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
