-- Threat: !InfrastructureShared
-- Name: 487839ed0501
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
