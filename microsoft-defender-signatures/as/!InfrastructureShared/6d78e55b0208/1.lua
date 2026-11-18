-- Threat: !InfrastructureShared
-- Name: 6d78e55b0208
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
