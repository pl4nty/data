-- Threat: !InfrastructureShared
-- Name: 4e29deccccac
-- Type: 21

if mp.get_mpattribute("Lua:ASPXExt") or mp.get_mpattribute("Lua:ASPExt") then
  return mp.INFECTED
end
return mp.LOWFI
