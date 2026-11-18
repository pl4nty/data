-- Threat: !InfrastructureShared
-- Name: 8540334b7974
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
