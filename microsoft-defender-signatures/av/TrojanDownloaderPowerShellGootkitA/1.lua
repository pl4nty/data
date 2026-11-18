-- Threat: TrojanDownloader:PowerShell/Gootkit.A
-- Type: 13
-- MpAttributes: TrojanDownloader:VBS/GootKitsd2 & PowerShell:Get-ItemProperty & SCRIPT:PsAssembly.A & MpIsPowerShellAMSIScan

local l_0_0 = mp.getfilesize()
if l_0_0 < 3500 then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
  if l_0_1 == mp.SCANREASON_AMSI then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_2:find("powershell", 1, true) then
      local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
      if l_0_3 then
        local l_0_5, l_0_6 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
        if l_0_5 and l_0_6 == nil then
          return mp.INFECTED
        end
      end
    end
    return mp.CLEAN
  end
end
return mp.CLEAN
