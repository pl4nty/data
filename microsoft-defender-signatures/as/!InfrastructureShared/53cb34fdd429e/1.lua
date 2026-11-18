-- Threat: !InfrastructureShared
-- Name: 53cb34fdd429e
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
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[9].utf8p2
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[10].utf8p2
end
local l_0_1 = false
if l_0_0 ~= nil then
  local l_0_2 = mp.GetExecutablesFromCommandLine(l_0_0)
  for l_0_3, l_0_4 in ipairs(l_0_2) do
    l_0_4 = mp.ContextualExpandEnvironmentVariables(l_0_4)
    if l_0_4 then
      l_0_4 = l_0_4:lower()
      if string.match(l_0_4, "^c:\\program files %(x86%)\\adobe\\") ~= nil or string.match(l_0_4, "^c:\\program files\\adobe\\") ~= nil then
        return mp.CLEAN
      end
      if sysio.IsFileExists(l_0_4) and not mp.IsKnownFriendlyFile(l_0_4, false, false) then
        if this_sigattrlog[2].matched then
          local l_0_5 = "appdata\\local\\microsoft\\onedrive\\onedrive.exe"
          if string.sub(l_0_4, -string.len(l_0_5)) == l_0_5 then
            return mp.CLEAN
          end
          local l_0_6 = "\\google\\chrome\\application\\"
          if string.sub(l_0_4, -62, -36) == l_0_6 then
            return mp.CLEAN
          end
        end
        if string.find(l_0_4, ":\\users\\.+\\appdata\\local\\deepl\\app.+\\deepl%.exe") then
          return mp.CLEAN
        end
        l_0_1 = true
        mp.ReportLowfi(l_0_4, 1132070965)
      end
    end
  end
end
if this_sigattrlog[6].matched and not l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
