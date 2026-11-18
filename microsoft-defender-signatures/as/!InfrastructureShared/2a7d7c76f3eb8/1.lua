-- Threat: !InfrastructureShared
-- Name: 2a7d7c76f3eb8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) then
  local l_0_1 = l_0_0.image_path
  local l_0_2 = mp.GetProcessCommandLine(l_0_0.ppid)
  if not isnull(l_0_1) and not isnull(l_0_2) then
    l_0_1 = string.lower(l_0_1)
    l_0_2 = string.lower(l_0_2)
    if string.find(l_0_1, "\\system32\\dllhost.exe", 1, true) and string.find(l_0_2, "{3e5fc7f9-9a51-4367-9063-a120244fbec7}", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
