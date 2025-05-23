-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\137b36dd2fd18\1.luac 

-- params : ...
-- function num : 0
if GetRollingQueueKeys("Medicated64Sliver") or GetRollingQueueKeys("Medicated32Sliver") then
  return mp.INFECTED
end
return mp.CLEAN

