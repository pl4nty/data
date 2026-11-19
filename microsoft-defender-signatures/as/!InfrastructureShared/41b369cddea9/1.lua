-- Threat: !InfrastructureShared
-- Name: 41b369cddea9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil then
  local l_0_1 = string.lower(l_0_0)
  if string.find(l_0_1, "commcmd.dll", 1, true) or string.find(l_0_1, "shell32.dll", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = extractDllForRegproc(l_0_0)
  if l_0_2 then
    l_0_2 = mp.ContextualExpandEnvironmentVariables(l_0_2)
    if sysio.IsFileExists(l_0_2) then
      bm.add_related_file(l_0_2)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
