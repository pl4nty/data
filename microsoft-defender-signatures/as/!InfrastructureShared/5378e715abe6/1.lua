-- Threat: !InfrastructureShared
-- Name: 5378e715abe6
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
