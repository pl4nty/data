-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11db34bb743c1\0x000003f5_luac 

-- params : ...
-- function num : 0
if not IsADConnectRole() then
  return mp.CLEAN
end
local l_0_0 = nil
if (this_sigattrlog[3]).matched then
  l_0_0 = (this_sigattrlog[3]).utf8p2
end
if l_0_0 ~= nil and l_0_0:match("\\ADSyncMSA%w%w%w%w%w%$") then
  return mp.INFECTED
end
return mp.CLEAN

