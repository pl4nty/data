-- Threat: !InfrastructureShared
-- Name: 7978be481496
-- Type: 21

if peattributes.ismsil == true and peattributes.headerchecksum0 == true then
  return mp.INFECTED
end
return mp.CLEAN
