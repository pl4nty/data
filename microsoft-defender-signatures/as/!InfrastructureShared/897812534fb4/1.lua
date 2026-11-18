-- Threat: !InfrastructureShared
-- Name: 897812534fb4
-- Type: 21

if peattributes.ismsil == true and peattributes.headerchecksum0 == true then
  return mp.INFECTED
end
return mp.CLEAN
