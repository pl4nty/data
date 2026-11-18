-- Threat: !InfrastructureShared
-- Name: 15b3cb962868
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(string.lower(l_0_0), "\\program files", 1, true) or string.find(string.lower(l_0_0), "\\steam", 1, true) or string.find(string.lower(l_0_0), "torrent.exe", 1, true) or string.find(string.lower(l_0_0), "game", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
