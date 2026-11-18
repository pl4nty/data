-- Threat: !InfrastructureShared
-- Name: 88789e797f28
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
