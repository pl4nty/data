-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELPowerShellFakeCaptchaC\0x000007be_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetNormalizedScript)(true)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
local l_0_1, l_0_2 = l_0_0:gsub("[%+\']", "")
if l_0_2 < 10 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = (MpCommon.StringRegExpSearch)("https?://", l_0_1)
if l_0_3 == false then
  return mp.CLEAN
end
;
(mp.vfo_add_buffer)(l_0_1, "[StrDeObfus]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
if (string.find)(l_0_1, "|iex", 1, true) or (string.find)(l_0_1, "iex(", 1, true) or (string.find)(l_0_1, "invoke-", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

