-- Threat: !InfrastructureShared
-- Name: 23784e96b466
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
