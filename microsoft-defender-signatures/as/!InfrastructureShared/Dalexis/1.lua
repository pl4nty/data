-- Threat: !InfrastructureShared
-- Name: Dalexis
-- Type: 15

function RemoveDalexisBaseFile(l_1_0)
  local l_1_1 = sysio.GetProcessFromFileName(l_1_0)
  
  for l_1_2, l_1_3 in pairs(l_1_1) do
    local l_1_4 = string.lower(sysio.GetFileNameFromProcess(string.format("pid:%d,ProcessStart:%u", l_1_3.pid, l_1_3.starttime)))
    if string.sub(l_1_4, -4) == ".scr" then
      sysio.DeleteFile(l_1_4)
    end
  end
end

local l_0_0 = Remediation.Threat
if l_0_0.Active and string.match(l_0_0.Name, "TrojanDownloader:Win32/Dalexis") then
  for l_0_1, l_0_2 in pairs(l_0_0.Resources) do
    if l_0_2.Schema == "process" then
      RemoveDalexisBaseFile(l_0_2.Path)
    end
  end
end
