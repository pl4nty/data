-- Threat: !InfrastructureShared
-- Name: 69b3b4eae805
-- Type: 21

local l_0_0
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p1
end
if l_0_0 ~= nil and sysio.IsFileExists(l_0_0) then
  mp.ReportLowfi(l_0_0, 1766475964)
end
return mp.INFECTED
