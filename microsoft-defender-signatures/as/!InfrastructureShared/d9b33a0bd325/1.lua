-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d9b33a0bd325\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[2]).matched and (this_sigattrlog[2]).utf8p2 then
  local l_0_0 = 600
  local l_0_1 = 10
  AppendToRollingQueue("TEAMS_CALL_PLACED", "LOG_FILE", "true", l_0_0, l_0_1, 0)
end
do
  return mp.CLEAN
end

