-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2f29e12759a2\1.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("MpIsPowerShellAMSIScan") then
  return mp.CLEAN
end
local l_0_0 = (mp.GetBruteMatchData)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = ""
if l_0_0.is_header then
  l_0_1 = (string.lower)(tostring(headerpage))
else
  l_0_1 = (string.lower)(tostring(footerpage))
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = "path\\s+c:\\\\*\\*?%?([\\s;]|$)"
local l_0_3, l_0_4 = (MpCommon.StringRegExpSearch)(l_0_2, l_0_1)
l_0_2 = "path\\s+[\"\']c:\\\\*\\*?%?[\"\']([\\s;]|$)"
local l_0_5, l_0_6 = (MpCommon.StringRegExpSearch)(l_0_2, l_0_1)
if IsCloudTestMachine() then
  return mp.CLEAN
end
if l_0_3 == false and l_0_5 == false then
  return mp.CLEAN
end
local l_0_7 = set_research_data
local l_0_8 = "BadExclusion"
local l_0_9 = MpCommon.Base64Encode
do
  l_0_9 = l_0_9(l_0_4 or l_0_6)
  l_0_7(l_0_8, l_0_9, false)
  l_0_7 = addDisruptionInfo
  l_0_8 = true
  l_0_7(l_0_8)
  l_0_7 = mp
  l_0_7 = l_0_7.INFECTED
  do return l_0_7 end
  -- DECOMPILER ERROR at PC83: freeLocal<0 in 'ReleaseLocals'

end

