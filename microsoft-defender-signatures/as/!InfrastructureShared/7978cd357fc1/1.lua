-- Threat: !InfrastructureShared
-- Name: 7978cd357fc1
-- Type: 21

if peattributes.amd64_image == true and (peattributes.isdll == true or peattributes.isexe == true) then
  return mp.INFECTED
end
return mp.CLEAN
