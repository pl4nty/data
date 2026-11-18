-- Threat: !InfrastructureShared
-- Name: 103781259e139
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
