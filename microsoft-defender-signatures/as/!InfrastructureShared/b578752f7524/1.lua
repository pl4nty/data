-- Threat: !InfrastructureShared
-- Name: b578752f7524
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
