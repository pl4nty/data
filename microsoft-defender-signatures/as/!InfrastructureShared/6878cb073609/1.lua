-- Threat: !InfrastructureShared
-- Name: 6878cb073609
-- Type: 21

if mp.get_mpattribute("Lua:FnameAttr!ffmpeg.dll") then
  return mp.INFECTED
end
return mp.CLEAN
