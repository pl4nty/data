-- Threat: !InfrastructureShared
-- Name: 9ed7ab2dde57
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") ~= "rundll32.exe" then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(mp.GetProcessCommandLine(l_0_0.ppid))
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if string.find(l_0_2, ".dll", 1, true) then
    return mp.CLEAN
  end
  if string.find(l_0_2, "#1", 1, true) or string.find(l_0_2, "#2", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
