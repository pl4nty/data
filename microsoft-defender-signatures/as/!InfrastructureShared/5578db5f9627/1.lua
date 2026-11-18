-- Threat: !InfrastructureShared
-- Name: 5578db5f9627
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
