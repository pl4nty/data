-- Threat: !InfrastructureShared
-- Name: 57297b4f9ada
-- Type: 21

if mp.get_mpattribute("Lua:HTMLExt") then
  return mp.INFECTED
end
return mp.CLEAN
