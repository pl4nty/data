-- Threat: !InfrastructureShared
-- Name: 3678b1b2ad49
-- Type: 21

if peattributes.isexe and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
