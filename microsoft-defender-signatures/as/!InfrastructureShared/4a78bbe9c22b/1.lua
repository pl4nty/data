-- Threat: !InfrastructureShared
-- Name: 4a78bbe9c22b
-- Type: 21

if mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
