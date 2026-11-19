-- Threat: !InfrastructureShared
-- Name: 11540120b60fb
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
