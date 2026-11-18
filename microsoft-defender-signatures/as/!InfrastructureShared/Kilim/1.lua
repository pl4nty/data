-- Threat: !InfrastructureShared
-- Name: Kilim
-- Type: 17

function GetFolderPathFromFile(l_1_0)
  if not l_1_0 then
    return nil
  end
  local l_1_1 = string.len(l_1_0)
  local l_1_2 = string.reverse(l_1_0)
  if l_1_2 then
    local l_1_3, l_1_4 = string.find(l_1_2, "\\", 1, true)
    if l_1_3 then
      l_1_2 = string.sub(l_1_0, 1, l_1_1 - l_1_4 + 1)
      return l_1_2
    end
  end
  return nil
end

local l_0_0 = MpDetection.GetCurrentThreat()
if string.match(l_0_0.Name, "Kilim") then
  local l_0_1
  for l_0_2, l_0_3 in pairs(l_0_0.Resources) do
    if l_0_3.Schema == "file" then
      l_0_1 = GetFolderPathFromFile(l_0_3.Path)
      if l_0_1 and sysio.IsFolderExists(l_0_1) then
        MpDetection.ScanResource("folder://" .. l_0_1)
      end
    end
  end
end
