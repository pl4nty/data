-- Threat: !InfrastructureShared
-- Name: !#LUA:EOP:BitTorrent
-- Type: 10
-- MpAttributes: PUA:CERT:EOP:BitTorrent

local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.InternalName
if l_0_1 then
  l_0_1 = string.lower(l_0_1)
else
  return mp.CLEAN
end
local l_0_2 = string.lower(mp.getfilename())
local l_0_3, l_0_4 = l_0_2:match("(.+\\)([^\\]+)$")
if string.sub(l_0_4, 1, 9) == "uninstall" then
  return mp.CLEAN
end
if string.find(l_0_1, "utorrent", 1, true) or string.find(l_0_1, "utweb", 1, true) then
  mp.set_mpattribute("PUA:Block:uTorrent")
end
if string.find(l_0_1, "bittorrent", 1, true) or string.find(l_0_1, "btweb", 1, true) then
  mp.set_mpattribute("PUA:Block:BitTorrent")
end
return mp.CLEAN
