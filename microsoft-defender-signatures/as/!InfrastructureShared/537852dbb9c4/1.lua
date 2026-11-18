-- Threat: !InfrastructureShared
-- Name: 537852dbb9c4
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
