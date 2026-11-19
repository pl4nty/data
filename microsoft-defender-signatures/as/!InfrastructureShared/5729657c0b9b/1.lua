-- Threat: !InfrastructureShared
-- Name: 5729657c0b9b
-- Type: 21

if mp.get_mpattribute("Lua:ASPXExt") then
  return mp.INFECTED
end
return mp.CLEAN
