-- Threat: !InfrastructureShared
-- Name: 3d782a4402ae
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
