-- Threat: !InfrastructureShared
-- Name: Swapex
-- Type: 14

function getSystemDriverPath()
  local l_1_0 = MpCommon.ExpandEnvironmentVariables("%SystemRoot%")
  
  if not l_1_0 then
    return nil
  end
  return l_1_0 .. "\\System32\\drivers\\"
end

function getDriverName(l_2_0)
  local l_2_1, l_2_2
  for l_2_3, l_2_4 in pairs(l_2_0.Resources) do
    if l_2_4.Schema == "file" then
      local l_2_5 = string.lower(l_2_4.Path)
      local l_2_6 = getSystemDriverPath()
      if l_2_6 and string.find(l_2_5, l_2_6:lower(), 1, true) then
        local l_2_7 = string.match(l_2_5, "\\([^\\]+)%.sys")
        if l_2_7 then
          l_2_2 = l_2_7
          l_2_1 = l_2_5
          break
        end
      end
    end
  end
  return l_2_2, l_2_1
end

local l_0_0 = Remediation.Threat
if l_0_0.Active then
  local l_0_1, l_0_2 = getDriverName(l_0_0)
  if l_0_1 then
    Remediation.FfrDriverDeleteByDriverName(l_0_1)
    local l_0_3 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\" .. l_0_1
    Remediation.BtrDeleteRegKey(l_0_3)
  end
  if l_0_2 then
    Remediation.BtrDeleteFile(l_0_2)
  end
end
