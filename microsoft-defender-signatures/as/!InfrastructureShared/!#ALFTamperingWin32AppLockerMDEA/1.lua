-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTamperingWin32AppLockerMDEA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = tostring(headerpage) .. tostring(footerpage)
l_0_0 = (string.lower)(l_0_0)
local l_0_1 = nil
local l_0_2 = (string.match)(l_0_0, "<conditions>.*publishername=\"(.-)\".*</conditions>")
l_0_2 = (string.match)(l_0_0, "<conditions>.*path=\"(.-)\".*</conditions>")
if l_0_2 and ((string.find)(l_0_2, "program files\\windows defender\\", 1, true) or (string.find)(l_0_2, "\\windows defender advanced threat protection", 1, true)) then
  l_0_1 = true
end
l_0_2 = (string.match)(l_0_0, "<conditions>.*binaryname=\"(.-)\".*</conditions>")
if l_0_2 and isMDEBlockingPolicy(l_0_2) then
  l_0_1 = true
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_3 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_3 then
  return mp.CLEAN
end
l_0_3 = (MpCommon.PathToWin32Path)(l_0_3)
AppendToRollingQueue("RQ_RecentAppLockerPolicyFileDropped", l_0_3, l_0_2, 86400, 50, 1)
return mp.INFECTED

