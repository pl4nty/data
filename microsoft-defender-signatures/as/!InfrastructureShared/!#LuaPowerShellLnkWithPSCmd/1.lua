-- Threat: !InfrastructureShared
-- Name: !#Lua:PowerShell/LnkWithPSCmd
-- Type: 13

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("LnkWithPowerShellCmd", true)
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2:match("anaconda powershell prompt.+%.lnk") then
  mp.set_mpattribute("Lua:ExcludeAnacondaPS")
end
if l_0_0 == 0 and l_0_1 == true then
  if mp.get_mpattribute("AGGR:PowerShell/EncodedCommand") or mp.get_mpattribute("AGGR:PowerShell/EncodedArgs") then
    mp.set_mpattribute("Lua:LnkFileWithEncodedPSCmd")
  end
  if mp.get_mpattribute("AGGR:PowerShell/Hidden") then
    mp.set_mpattribute("Lua:LnkFileWithHiddenPSCmd")
  end
  if mp.get_mpattribute("AGGR:PowerShell/ExecutionPolicyBypass") or mp.get_mpattribute("AGGR:PowerShell/ExecutionPolicyUnrestricted") then
    mp.set_mpattribute("Lua:LnkFileWithExPolicyBypassedPSCmd")
  end
end
return mp.CLEAN
