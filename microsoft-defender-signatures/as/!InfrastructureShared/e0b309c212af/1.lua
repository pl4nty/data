-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e0b309c212af\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1 = 1800
  local l_0_2 = 10
  AppendToRollingQueue("MpTamperRegKeyOldValues", "TreatAs", (this_sigattrlog[1]).utf8p1 .. "|" .. l_0_0, l_0_1, l_0_2)
end
do
  return mp.INFECTED
end

