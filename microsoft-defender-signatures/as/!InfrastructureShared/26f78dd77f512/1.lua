-- Threat: !InfrastructureShared
-- Name: 26f78dd77f512
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
