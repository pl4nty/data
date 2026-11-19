-- Threat: !InfrastructureShared
-- Name: b540ef5073ff
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
