-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUABitTorrent\0x00001714_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("PUA:HSTR:OnePlatformInstaller") then
  if (mp.get_mpattribute)("PUA:OnePlatform_uTorrent_Bundler") then
    (mp.set_mpattribute)("PUA:Block:uTorrent_BundleInstaller")
  end
  if (mp.get_mpattribute)("PUA:OnePlatform_BitTorrent_Bundler") then
    (mp.set_mpattribute)("PUA:Block:BitTorrent_BundleInstaller")
  end
end
return mp.CLEAN

