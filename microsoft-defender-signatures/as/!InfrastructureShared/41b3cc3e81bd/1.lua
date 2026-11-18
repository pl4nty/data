-- Threat: !InfrastructureShared
-- Name: 41b3cc3e81bd
-- Type: 21

local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
if l_0_0 ~= nil and string.find(l_0_0, "wmic", 1, true) and string.find(l_0_0, "\\low\\", 1, true) and string.find(l_0_0, ".tmp", 1, true) then
  local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    if sysio.IsFileExists(l_0_3) then
      bm.add_related_file(l_0_3)
    end
  end
  return mp.INFECTED
end
return mp.CLEAN
