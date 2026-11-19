-- Threat: !InfrastructureShared
-- Name: 127784d8d7443
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
