-- Threat: !InfrastructureShared
-- Name: 69b3cc43b904
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level < MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath()
if l_0_1 ~= nil and string.len(l_0_1) >= 15 then
  local l_0_2 = {
    ["devenv.exe"] = true,
    ["w3wp.exe"] = true,
    ["iisexpress.exe"] = true,
    ["encompass.exe"] = true,
    ["dtexec.exe"] = true,
    ["sqlnexus.exe"] = true,
    ["mesclient.exe"] = true,
    ["ssms.exe"] = true,
    ["msbuild.exe"] = true,
    ["isserverexec.exe"] = true
  }
  local l_0_3 = string.lower(string.sub(l_0_1, -15)):match("\\([^\\]+)$")
  if l_0_2[l_0_3] then
    return mp.CLEAN
  end
end
local l_0_4
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_4 = this_sigattrlog[3].utf8p2
end
if l_0_4 ~= nil then
  local l_0_5 = mp.GetExecutablesFromCommandLine(l_0_4)
  for l_0_6, l_0_7 in ipairs(l_0_5) do
    l_0_7 = mp.ContextualExpandEnvironmentVariables(l_0_7)
    if sysio.IsFileExists(l_0_7) then
      bm.add_related_file(l_0_7)
    end
  end
end
return mp.INFECTED
