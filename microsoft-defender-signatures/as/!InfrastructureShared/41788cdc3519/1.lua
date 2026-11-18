-- Threat: !InfrastructureShared
-- Name: 41788cdc3519
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
