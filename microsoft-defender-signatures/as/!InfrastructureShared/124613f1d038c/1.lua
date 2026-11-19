-- Threat: !InfrastructureShared
-- Name: 124613f1d038c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
