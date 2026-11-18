-- Threat: !InfrastructureShared
-- Name: a540ba93b64d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
