-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9141e6b2d335\0x0000b98e_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p2 ~= nil then
  local l_0_0 = (this_sigattrlog[3]).utf8p1
  local l_0_1 = (this_sigattrlog[3]).utf8p2
  AppendToRollingQueue("ExternalRemoteService_Path", l_0_0, 1, 60)
  AppendToRollingQueue("ExternalRemoteService_PPid", l_0_1, 1, 60)
  return mp.INFECTED
end
do
  return mp.CLEAN
end

