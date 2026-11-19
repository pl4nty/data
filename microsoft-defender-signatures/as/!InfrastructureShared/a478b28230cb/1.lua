-- Threat: !InfrastructureShared
-- Name: a478b28230cb
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
