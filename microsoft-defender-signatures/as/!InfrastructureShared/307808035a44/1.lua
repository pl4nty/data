-- Threat: !InfrastructureShared
-- Name: 307808035a44
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
