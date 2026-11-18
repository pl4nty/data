-- Threat: !InfrastructureShared
-- Name: 947825fae3ce
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
