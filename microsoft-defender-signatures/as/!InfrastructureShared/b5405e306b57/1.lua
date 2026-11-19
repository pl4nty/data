-- Threat: !InfrastructureShared
-- Name: b5405e306b57
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
