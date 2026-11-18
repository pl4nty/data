-- Threat: !InfrastructureShared
-- Name: 9c78eeb6c3fa
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
