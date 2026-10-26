-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\69414d227c96\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (nri.GetRawResponseBlob)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {}
l_0_1.NRI_ResponseBlob = tohex(l_0_0)
;
(nri.AddTelemetry)(0, l_0_1)
return mp.INFECTED

