-- Threat: !InfrastructureShared
-- Name: 4eb3719c1f04
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  local l_0_1 = {
    ["tentacle.exe"] = true,
    ["javaw.exe"] = true,
    ["java.exe"] = true,
    ["ruby.exe"] = true,
    ["actifio-install.exe"] = true,
    ["actifio-install.tmp"] = true,
    ["installer.exe"] = true,
    ["monitoringhost.exe"] = true,
    ["choco.exe"] = true,
    ["splunkd.exe"] = true,
    ["qualysagent.exe"] = true,
    ["agentcore.exe"] = true,
    ["azurerolelifecycletask.exe"] = true
  }
  local l_0_2 = l_0_0:match("\\([^\\]+)$")
  if l_0_2 ~= nil then
    l_0_2 = string.lower(l_0_2)
    if l_0_1[l_0_2] then
      return mp.CLEAN
    end
  end
end
local l_0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_3 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_3 ~= nil then
  local l_0_4 = l_0_3:match("binpath=(.+)")
  l_0_4 = mp.GetExecutablesFromCommandLine(l_0_4)
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
    if sysio.IsFileExists(l_0_6) == true then
      bm.add_related_file(l_0_6)
    end
  end
end
return mp.INFECTED
