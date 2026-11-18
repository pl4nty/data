-- Threat: !InfrastructureShared
-- Name: 11678d7449bdf
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
