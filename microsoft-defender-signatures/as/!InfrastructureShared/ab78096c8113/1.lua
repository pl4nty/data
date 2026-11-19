-- Threat: !InfrastructureShared
-- Name: ab78096c8113
-- Type: 21

if peattributes.isexe and peattributes.ismsil == false and mp.getfilesize() < 15000 then
  return mp.INFECTED
end
return mp.CLEAN
