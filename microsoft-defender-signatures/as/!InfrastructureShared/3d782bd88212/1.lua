-- Threat: !InfrastructureShared
-- Name: 3d782bd88212
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
