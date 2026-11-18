-- Threat: !InfrastructureShared
-- Name: 427841b584c1
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
