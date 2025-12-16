-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUABitTorrent\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("PUA:HSTR:OnePlatformInstaller") then
  if (mp.get_mpattribute)("PUA:OnePlatform_uTorrent_Bundler") then
    (mp.set_mpattribute)("PUA:Block:uTorrent_BundleInstaller")
    return mp.INFECTED
  end
  if (mp.get_mpattribute)("PUA:OnePlatform_BitTorrent_Bundler") then
    (mp.set_mpattribute)("PUA:Block:BitTorrent_BundleInstaller")
    return mp.INFECTED
  end
end
local l_0_0 = (pe.get_versioninfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.FileDescription
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1:gsub("%W", ""))
if (string.find)(l_0_1, "utorrent", 1, true) or (string.find)(l_0_1, "trretweb", 1, true) or (string.find)(l_0_1, "utrrntweb", 1, true) or (string.find)(l_0_1, "uorrntclassic", 1, true) then
  (mp.set_mpattribute)("PUA:Block:uTorrent_BundleInstaller")
  return mp.INFECTED
end
if (string.find)(l_0_1, "bittorrent", 1, true) or (string.find)(l_0_1, "bttorrent", 1, true) then
  (mp.set_mpattribute)("PUA:Block:BitTorrent_BundleInstaller")
  return mp.INFECTED
end
return mp.CLEAN

