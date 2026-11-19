-- Threat: !InfrastructureShared
-- Name: 48785d9f153a
-- Type: 21

if peattributes.amd64_image == true and (peattributes.isexe == true or peattributes.isdll == true) then
  return mp.INFECTED
end
return mp.CLEAN
