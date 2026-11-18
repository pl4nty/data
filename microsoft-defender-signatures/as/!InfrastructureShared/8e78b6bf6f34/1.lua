-- Threat: !InfrastructureShared
-- Name: 8e78b6bf6f34
-- Type: 21

if peattributes.amd64_image == true and (peattributes.isdll == true or peattributes.isexe == true) then
  return mp.INFECTED
end
return mp.CLEAN
