-- Threat: !InfrastructureShared
-- Name: ba78ce2f8c8e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
