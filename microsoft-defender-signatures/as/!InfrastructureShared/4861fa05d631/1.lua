-- Threat: !InfrastructureShared
-- Name: 4861fa05d631
-- Type: 21

if peattributes.ismsil == true and peattributes.headerchecksum0 == true then
  return mp.INFECTED
end
return mp.CLEAN
