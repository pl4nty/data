-- Threat: !InfrastructureShared
-- Name: ba78cc21b612
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
