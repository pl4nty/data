-- Threat: !InfrastructureShared
-- Name: 39d71b140759
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if string.sub(l_0_1, 1, 7) == "msiexec" then
  local l_0_2 = mp.GetParentProcInfo()
  if l_0_2 ~= nil then
    local l_0_3 = string.lower(l_0_2.image_path)
    local l_0_4 = string.sub(l_0_3, -15):match("\\([^\\]+)$")
    local l_0_5 = {
      ["svchost.exe"] = true,
      ["taskeng.exe"] = true,
      ["taskhostw.exe"] = true
    }
    if l_0_5[l_0_4] then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
