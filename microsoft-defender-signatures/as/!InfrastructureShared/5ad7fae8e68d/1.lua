-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5ad7fae8e68d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = nil
l_0_2 = (string.match)(l_0_1, "binpath=\"?([^\"%s]+%.sys)\"?")
if not l_0_2 then
  AppendToRollingQueue("NewServiceCreated", l_0_1, l_0_2, 500)
  return mp.CLEAN
end
return mp.INFECTED

