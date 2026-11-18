-- Threat: !InfrastructureShared
-- Name: 227849acac73
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
