-- Threat: !InfrastructureShared
-- Name: 9b61bdec73fb
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
