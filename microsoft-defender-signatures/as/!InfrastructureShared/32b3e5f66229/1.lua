-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\32b3e5f66229\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 then
  local l_0_0 = (this_sigattrlog[1]).utf8p2
  local l_0_1 = (string.match)(l_0_0, "DestIp=(.-);")
  if isPrivateIP(l_0_1) then
    return mp.CLEAN
  end
  local l_0_2 = 600
  local l_0_3 = 10
  AppendToRollingQueue("TEAMS_CALL_PLACED", "UDP", l_0_0, l_0_2, l_0_3, 0)
end
do
  return mp.CLEAN
end

