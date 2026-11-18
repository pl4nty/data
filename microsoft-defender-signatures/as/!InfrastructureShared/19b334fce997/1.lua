-- Threat: !InfrastructureShared
-- Name: 19b334fce997
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -18) == "\\mailstorehome.exe" then
  return mp.CLEAN
end
if string.sub(l_0_0, -20) == "\\mailstoreclient.exe" then
  return mp.CLEAN
end
if string.sub(l_0_0, -13) == "\\explorer.exe" then
  return mp.CLEAN
end
local l_0_1
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[1].utf8p2
end
if l_0_1 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_1)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if sysio.IsFileExists(l_0_4) then
      bm.add_related_file(l_0_4)
    end
  end
end
return mp.INFECTED
