-- Threat: !InfrastructureShared
-- Name: d5401b8dd2c6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
