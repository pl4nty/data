-- Threat: !InfrastructureShared
-- Name: 50780b64e7f5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
