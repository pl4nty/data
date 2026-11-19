-- Threat: !InfrastructureShared
-- Name: 109b3a914d57c
-- Type: 21

if mp.get_sigattr_event_count(16384) > 50 then
  return mp.CLEAN
end
local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
end
local l_0_1 = 0
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if sysio.IsFileExists(l_0_4) == true then
      local l_0_5 = {
        [".exe"] = true
      }
      local l_0_6 = string.sub(l_0_4, -4)
      local l_0_7 = {
        ["cmd.exe"] = true,
        ["powershell.exe"] = true,
        ["pwsh.exe"] = true,
        ["cscript.exe"] = true,
        ["wscript.exe"] = true,
        ["mshta.exe"] = true
      }
      if l_0_6 ~= nil and l_0_5[l_0_6] == true then
        local l_0_8 = string.lower((l_0_4:match("\\([^\\]+)$")))
        if l_0_7[l_0_8] ~= true then
          bm.add_related_file(l_0_4)
          bm.add_threat_file(l_0_4)
          l_0_1 = 1
        end
      end
    end
  end
end
if l_0_1 == 1 then
  return mp.INFECTED
end
return mp.CLEAN
