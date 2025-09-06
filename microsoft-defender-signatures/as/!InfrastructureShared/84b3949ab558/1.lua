-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3949ab558\1.luac 

-- params : ...
-- function num : 0
reportSessionInformation()
addOverallNetworkVolume()
local l_0_0, l_0_1 = pcall(reportBmInfo)
if not l_0_0 and l_0_1 then
  (bm.add_related_string)("bmInfoFailReason", tostring(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED

