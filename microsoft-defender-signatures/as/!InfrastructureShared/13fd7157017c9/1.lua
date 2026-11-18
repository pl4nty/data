-- Threat: !InfrastructureShared
-- Name: 13fd7157017c9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) and not isnull(l_0_0.image_path) and not isnull(l_0_0.ppid) and string.find(l_0_0.image_path, "/bun", -4, true) then
  local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
  if isnull(l_0_1) then
    return mp.CLEAN
  end
  if string.find(string.lower(l_0_1), "js", -2, true) then
    local l_0_2 = mp.GetParentProcInfo(l_0_0.ppid)
    if not isnull(l_0_2) and not isnull(l_0_2.image_path) and not isnull(l_0_2.ppid) then
      if string.find(l_0_2.image_path, "/bun", -4, true) then
        local l_0_3 = mp.GetProcessCommandLine(l_0_2.ppid)
        if isnull(l_0_3) then
          return mp.CLEAN
        end
        if string.find(l_0_3, "run start", 1, true) then
          return mp.CLEAN
        end
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
