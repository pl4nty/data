-- Threat: !InfrastructureShared
-- Name: c5784dd658cc
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
