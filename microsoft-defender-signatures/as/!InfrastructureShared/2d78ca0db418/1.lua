-- Threat: !InfrastructureShared
-- Name: 2d78ca0db418
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
