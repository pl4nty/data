-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\WannaCrypt\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.ExpandEnvironmentVariables)("%SystemRoot%")
local l_0_1 = (MpCommon.ExpandEnvironmentVariables)("%temp%")
if l_0_0 then
  (MpDetection.ScanResource)("folder://" .. l_0_0 .. "\\intel")
end
if l_0_1 then
  (MpDetection.ScanResource)("folder://" .. l_0_1)
end

