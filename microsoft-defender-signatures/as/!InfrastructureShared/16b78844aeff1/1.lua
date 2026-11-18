-- Threat: !InfrastructureShared
-- Name: 16b78844aeff1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
