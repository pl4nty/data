-- Threat: !InfrastructureShared
-- Name: 201b34b0eb584
-- Type: 21

if bm.GetSignatureMatchDuration() > 50000000 then
  return mp.CLEAN
end
local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 then
  if string.find(string.lower(l_0_0), "\\program files", 1, true) or string.find(string.lower(l_0_0), "teamviewer", 1, true) or string.find(string.lower(l_0_0), "\\steam", 1, true) or string.find(string.lower(l_0_0), "torrent.exe", 1, true) or string.find(string.lower(l_0_0), "game", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN
