-- Threat: !InfrastructureShared
-- Name: 35b3dac29864
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if l_0_0 ~= nil then
  local l_0_1 = {
    ["\\winhlp32.exe"] = true,
    ["\\werfault.exe"] = true,
    ["\\imepadsv.exe"] = true,
    ["\\splwow64.exe"] = true,
    ["\\sgtool.exe"] = true,
    ["\\mdm.exe"] = true,
    ["\\sgpicfacetool.exe"] = true
  }
  local l_0_2 = string.lower(mp.ContextualExpandEnvironmentVariables(l_0_0))
  local l_0_3 = string.match(l_0_2, "(\\[^\\]+)$")
  if l_0_3 ~= nil and l_0_1[l_0_3] == true then
    return mp.CLEAN
  end
end
return mp.INFECTED
