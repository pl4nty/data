-- Threat: !InfrastructureShared
-- Name: 6478cbcfa2cd
-- Type: 21

if peattributes.ismsil and peattributes.no_security then
  return mp.INFECTED
end
return mp.CLEAN
