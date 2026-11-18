-- Threat: !InfrastructureShared
-- Name: 6b78b34397b1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
