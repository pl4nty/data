-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\63d7f89d79ba\1.luac 

-- params : ...
-- function num : 0
if GetRollingQueueKeys("IsClickFixCMD") == nil then
  return mp.CLEAN
end
return mp.INFECTED

