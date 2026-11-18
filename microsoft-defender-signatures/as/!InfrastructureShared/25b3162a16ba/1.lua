-- Threat: !InfrastructureShared
-- Name: 25b3162a16ba
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "fabricrouter", 1, true) or string.find(l_0_0, "game", 1, true) or string.find(l_0_0, "\\kodi", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
