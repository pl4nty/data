-- Threat: !InfrastructureShared
-- Name: b178c6af81af
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
