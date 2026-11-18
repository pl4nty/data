-- Threat: !InfrastructureShared
-- Name: 6d78fdf80350
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
