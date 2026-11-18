-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Script/PSRefload.A
-- Type: 13
-- MpAttributes: ALF:Trojan:PowerShell/PsRefLoad.E

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetParentProcInfo(l_0_0)
if l_0_1 ~= nil then
  local l_0_2 = string.lower(l_0_1.image_path)
  if l_0_2 and (string.find(l_0_2, "wscript.exe", 1, true) or string.find(l_0_2, "csript.exe", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
