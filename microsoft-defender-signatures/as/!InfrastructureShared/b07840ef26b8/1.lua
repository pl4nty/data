-- Threat: !InfrastructureShared
-- Name: b07840ef26b8
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
