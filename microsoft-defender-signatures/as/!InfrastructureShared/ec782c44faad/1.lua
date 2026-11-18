-- Threat: !InfrastructureShared
-- Name: ec782c44faad
-- Type: 21

if peattributes.ismsil and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
