-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:PowerShell/PSLnkReadEndOfFile.A
-- Type: 13

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("LnkWithPowerShellCmd", true)
if l_0_0 == 0 and l_0_1 == true and mp.get_mpattribute("SCPT:PSReadEndOfFileSameFolder.A") then
  return mp.INFECTED
end
return mp.CLEAN
