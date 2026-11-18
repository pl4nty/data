-- Threat: !InfrastructureShared
-- Name: 99d7ffc49e4f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) and not isnull(l_0_0.ppid) then
  local l_0_1 = string.lower(l_0_0.image_path)
  local l_0_2 = l_0_1:match("([^\\]+)$")
  if l_0_2 == "powershell.exe" or l_0_2 == "cmd.exe" or l_0_2 == "powershell_ise.exe" then
    local l_0_3 = string.lower(mp.GetProcessCommandLine(l_0_0.ppid))
    if isnull(l_0_3) then
      return mp.CLEAN
    end
    if string.find(l_0_3, ".ps1", 1, true) or string.find(l_0_3, ".bat", 1, true) or string.find(l_0_3, ".cmd", 1, true) then
      return mp.CLEAN
    end
  end
  local l_0_4 = {
    ["cmd.exe"] = true,
    ["powershell.exe"] = true,
    ["powershell_ise.exe"] = true,
    ["explorer.exe"] = true,
    ["winrshost.exe"] = true,
    ["wsmprovhost.exe"] = true,
    ["rundll32.exe"] = true,
    ["wmiprvse.exe"] = true
  }
  if l_0_4[l_0_2] then
    return mp.INFECTED
  end
end
return mp.CLEAN
