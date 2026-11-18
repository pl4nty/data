-- Threat: !InfrastructureShared
-- Name: 75b35c93e83a
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].utf8p2
  l_0_0 = l_0_1
  if l_0_0 == nil or l_0_0 == "" then
    return mp.CLEAN
  end
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
  if sysio.IsFileExists(l_0_0) then
    local l_0_2 = string.lower(l_0_1)
    if string.sub(l_0_2, 1, 1) == "%" and (string.find(l_0_2, "%commonprogramfiles%\\system\\wab32.dll", 1, true) or string.find(l_0_2, "%CommonProgramFiles(x86)%\\system\\wab32.dll", 1, true)) then
      return mp.CLEAN
    end
    if not string.find(l_0_0, "\\outlook express\\wab32.dll", 1, true) then
      bm.add_related_file(l_0_0)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
