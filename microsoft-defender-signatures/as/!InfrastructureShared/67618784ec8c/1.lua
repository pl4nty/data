-- Threat: !InfrastructureShared
-- Name: 67618784ec8c
-- Type: 21

if peattributes.ismsil and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
