-- Threat: !InfrastructureShared
-- Name: b0784c0f9dad
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
