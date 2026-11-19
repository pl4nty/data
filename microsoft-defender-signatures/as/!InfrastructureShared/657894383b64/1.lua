-- Threat: !InfrastructureShared
-- Name: 657894383b64
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
