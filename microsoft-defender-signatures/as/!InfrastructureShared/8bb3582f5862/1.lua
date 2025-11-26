-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8bb3582f5862\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p1 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[2]).utf8p1)
local l_0_1 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%SystemDrive%\\Program Files (x86)\\Common Files\\"))
local l_0_2 = (string.lower)((MpCommon.ExpandEnvironmentVariables)("%SystemDrive%\\Program Files\\Common Files\\"))
if StringStartsWith(l_0_0, l_0_1) or StringStartsWith(l_0_0, l_0_2) then
  return mp.CLEAN
end
return mp.INFECTED

