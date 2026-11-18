-- Threat: !InfrastructureShared
-- Name: 8dd7cec258e3
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = mp.GetParentProcInfo(l_0_0.ppid)
  if l_0_1 ~= nil then
    local l_0_2 = string.lower(l_0_1.image_path)
    local l_0_3 = string.lower(mp.GetProcessCommandLine(l_0_1.ppid))
    if l_0_2 and l_0_3 and string.find(l_0_2, "dllhost.exe", 1, true) and string.find(l_0_3, "{3e5fc7f9-9a51-4367-9063-a120244fbec7}", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
