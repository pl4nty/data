-- Threat: !InfrastructureShared
-- Name: 105b333037ae1
-- Type: 21

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
local l_0_1
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_1 = string.lower(this_sigattrlog[7].utf8p1)
end
if l_0_1 == nil or #l_0_1 < 48 then
  return mp.CLEAN
end
local l_0_2 = 0
if string.find(l_0_1, "\\\\admin$\\\\", 1, true) or string.find(l_0_1, "\\[a-z]%$\\") then
  local l_0_3 = string.lower(MpCommon.PathToWin32Path(l_0_1))
  if l_0_3 ~= nil and string.sub(l_0_3, 0, 2) == "\\\\" and l_0_0 ~= nil then
    local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_0)
    for l_0_5, l_0_6 in ipairs(l_0_4) do
      l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
      if sysio.IsFileExists(l_0_6) == true then
        local l_0_7 = {
          [".exe"] = true
        }
        local l_0_8 = string.sub(l_0_6, -4)
        local l_0_9 = {
          ["cmd.exe"] = true,
          ["powershell.exe"] = true,
          ["pwsh.exe"] = true,
          ["cscript.exe"] = true,
          ["wscript.exe"] = true,
          ["mshta.exe"] = true
        }
        if l_0_8 ~= nil and l_0_7[l_0_8] == true then
          local l_0_10 = string.lower((l_0_6:match("\\([^\\]+)$")))
          if l_0_9[l_0_10] ~= true then
            bm.add_related_file(l_0_6)
            l_0_2 = 1
          end
        end
      end
    end
  end
end
if l_0_2 == 1 then
  return mp.INFECTED
end
return mp.CLEAN
