-- Threat: !InfrastructureShared
-- Name: 3578e394291b
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
