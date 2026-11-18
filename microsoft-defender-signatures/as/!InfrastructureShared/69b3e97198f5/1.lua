-- Threat: !InfrastructureShared
-- Name: 69b3e97198f5
-- Type: 21

local l_0_0, l_0_1
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  if string.find(string.lower(this_sigattrlog[4].utf8p2), "/util /setieproxy", 1, true) ~= nil then
    return mp.CLEAN
  end
  l_0_1 = this_sigattrlog[4].ppid
  local l_0_2 = mp.GetParentProcInfo(l_0_1)
  if l_0_2 ~= nil then
    local l_0_3 = string.lower(l_0_2.image_path)
    if l_0_3 ~= nil and string.find(l_0_3, "udclientservice.exe", 1, true) ~= nil then
      return mp.CLEAN
    end
  end
else
  return mp.CLEAN
end
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[2].utf8p2))
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[3].utf8p2))
elseif this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(mp.ContextualExpandEnvironmentVariables(this_sigattrlog[1].utf8p2))
else
  return mp.CLEAN
end
if l_0_0 ~= nil then
  local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    if sysio.IsFileExists(l_0_6) then
      bm.add_related_file(l_0_6)
    end
  end
end
return mp.INFECTED
