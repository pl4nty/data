-- Threat: !InfrastructureShared
-- Name: 91b307051d85
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  local l_0_1 = mp.GetExecutablesFromCommandLine(string.lower(l_0_0))
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) and string.find(l_0_3, ".dll", 1, true) == nil then
      bm.add_related_file(l_0_3)
    end
  end
end
return mp.INFECTED
