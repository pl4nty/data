-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELTrojanLNKSusLnkDownloadB\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattributesubstring)("PACKED_WITH:[CMDEmbedded]") then
  return mp.CLEAN
end
local l_0_0 = 0
local l_0_1 = (mp.GetNormalizedScript)(true)
l_0_1 = (string.gsub)(l_0_1, "[%\'\"]%)?%+%(?[%\'\"]", "")
l_0_1 = (string.gsub)(l_0_1, "\"([%l%d]+)\"", "%1")
if l_0_0 < 2 then
  return mp.CLEAN
end
;
(mp.vfo_add_buffer)(l_0_1, "[StrConcat]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.INFECTED

