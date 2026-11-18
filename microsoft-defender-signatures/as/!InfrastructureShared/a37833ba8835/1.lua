-- Threat: !InfrastructureShared
-- Name: a37833ba8835
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
