-- Threat: !InfrastructureShared
-- Name: !#Lua:Trojan:PowerShell/PSLnkBasedPersistence.A
-- Type: 13
-- MpAttributes: SCRIPT:PSLnkPersistence.A

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("LnkWithPowerShellCmd", true)
if l_0_0 == 0 and l_0_1 == true then
  mp.ReportLowfi(mp.getfilename(), 818474255)
  return mp.INFECTED
end
return mp.CLEAN
