-- Threat: !InfrastructureShared
-- Name: 7cd788a3fede
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_1:lower()
l_0_1 = l_0_1:gsub("%^", "")
l_0_1 = l_0_1:gsub("'", "")
l_0_1 = l_0_1:gsub("%s+", " ")
if (string.find(l_0_1, "\\user data", 1, true) or string.find(l_0_1, "\\profiles", 1, true) or string.find(l_0_1, "\\opera stable", 1, true)) and (string.find(l_0_1, ".vbs", 1, true) or string.find(l_0_1, ".bat", 1, true) or string.find(l_0_1, "wscript", 1, true) or string.find(l_0_1, "tar -x", 1, true)) then
  local l_0_2 = mp.GetParentProcInfo()
  if l_0_2 ~= nil then
    local l_0_3 = string.lower(l_0_2.image_path)
    if l_0_3:match("([^\\]+)$") == "explorer.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
