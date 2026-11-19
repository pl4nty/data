-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:PowerShell/ClickFixPsObfus.A
-- Type: 13
-- MpAttributes: ALF:Trojan:Script/ClickFake.B | ALF:Trojan:Script/ClickFake.A

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
  if l_0_2 and string.find(l_0_2, "powershell.exe", 1, true) then
    local l_0_3 = mp.GetParentProcInfo(l_0_1.ppid)
    if l_0_3 then
      local l_0_4 = string.lower(l_0_3.image_path)
      if l_0_4 and string.find(l_0_4, "mshta.exe", 1, true) then
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
