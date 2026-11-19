-- Threat: !InfrastructureShared
-- Name: 477866fcca5c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
