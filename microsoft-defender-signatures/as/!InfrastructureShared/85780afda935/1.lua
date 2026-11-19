-- Threat: !InfrastructureShared
-- Name: 85780afda935
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
