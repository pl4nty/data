-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32PyArmorA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
local l_0_1 = l_0_0:match("^(.-)%-%>")
if not l_0_1 then
  return mp.CLEAN
end
;
(MpCommon.SetOriginalFileName)(l_0_1, "PyArmorBinary")
return mp.INFECTED

