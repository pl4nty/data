-- Threat: !InfrastructureShared
-- Name: 7a786bc441f5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
