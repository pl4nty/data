-- Threat: !InfrastructureShared
-- Name: bb787d0cbbe7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
