-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\15bb3dde04bd2\0x000003f7_luac 

-- params : ...
-- function num : 0
if not IsADConnectRole() then
  return mp.CLEAN
end
local l_0_0, l_0_1 = nil, nil
if (this_sigattrlog[3]).matched then
  l_0_0 = (this_sigattrlog[3]).utf8p1
end
if (this_sigattrlog[4]).matched then
  l_0_1 = (this_sigattrlog[4]).utf8p1
end
if l_0_0 ~= nil and l_0_1 ~= nil and (string.lower)(l_0_0:match("([^\\]+)$")) == (string.lower)(l_0_1:match("([^\\]+)$")) then
  return mp.INFECTED
end
return mp.CLEAN

