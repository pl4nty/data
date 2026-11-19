-- Threat: !InfrastructureShared
-- Name: 927873dfb3b5
-- Type: 21

if peattributes.isexe and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
