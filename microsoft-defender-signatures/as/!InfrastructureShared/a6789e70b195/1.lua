-- Threat: !InfrastructureShared
-- Name: a6789e70b195
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
