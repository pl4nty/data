-- Threat: !InfrastructureShared
-- Name: 8678ccd97801
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
