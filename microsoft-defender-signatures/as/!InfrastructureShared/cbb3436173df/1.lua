-- Threat: !InfrastructureShared
-- Name: cbb3436173df
-- Type: 21

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  local l_0_0 = this_sigattrlog[1].utf8p2
  if string.sub(l_0_0, -1) == "\\" then
    l_0_0 = string.sub(l_0_0, 0, #l_0_0 - 1)
  end
  local l_0_1 = 43200
  if string.sub(l_0_0, -28) == "\\start menu\\programs\\startup" then
    l_0_1 = 1
  end
  local l_0_2 = {}
  table.insert(l_0_2, l_0_0)
  MpCommon.SetPersistContextNoPath("BMLua:StartupFolderPathChange.EE", l_0_2, l_0_1)
  return mp.INFECTED
end
return mp.CLEAN
