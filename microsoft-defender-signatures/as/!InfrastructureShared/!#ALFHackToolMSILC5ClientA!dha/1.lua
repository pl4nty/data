-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:MSIL/C5Client.A!dha
-- Type: 8
-- MpAttributes: pea_ismsil

local l_0_0 = pe.get_versioninfo()
if l_0_0 ~= nil and (l_0_0.ProductName ~= nil and l_0_0.ProductName:find("C5.Client", 1, true) == 1 or l_0_0.FileDescription ~= nil and l_0_0.FileDescription:find("C5.Client", 1, true) == 1) then
  return mp.INFECTED
end
return mp.CLEAN
