-- Threat: !InfrastructureShared
-- Name: 55b317c40d3d
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
local l_0_1, l_0_2 = bm.get_process_relationships()
if l_0_1 == nil then
  return mp.CLEAN
end
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if l_0_4.image_path ~= nil then
    local l_0_5 = string.lower(string.match(l_0_4.image_path, "\\([^\\]+)$"))
    if l_0_5 == "msiexec.exe" then
      return mp.CLEAN
    end
  end
end
if l_0_0 ~= nil then
  local l_0_6 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_7, l_0_8 in ipairs(l_0_6) do
    l_0_8 = mp.ContextualExpandEnvironmentVariables(l_0_8)
    if sysio.IsFileExists(l_0_8) == true then
      bm.add_related_file(l_0_8)
    end
  end
end
return mp.INFECTED
