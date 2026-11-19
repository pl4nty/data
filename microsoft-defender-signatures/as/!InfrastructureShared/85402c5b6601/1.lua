-- Threat: !InfrastructureShared
-- Name: 85402c5b6601
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
