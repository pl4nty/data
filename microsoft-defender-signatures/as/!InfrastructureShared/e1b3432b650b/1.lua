-- Threat: !InfrastructureShared
-- Name: e1b3432b650b
-- Type: 21

if this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  local l_0_0 = string.match(this_sigattrlog[10].utf8p1, "\\([^\\]+)$")
  if l_0_0 then
    local l_0_1 = string.lower(l_0_0)
    if string.find(l_0_1, "winzipexpressforoffice.dll", 1, true) or string.find(l_0_1, "addin.dll", 1, true) or string.find(l_0_1, "add-in.dll", 1, true) then
      return mp.CLEAN
    end
  end
end
local l_0_2
for l_0_3 = 1, mp.SIGATTR_LOG_SZ do
  if sigattr_tail[l_0_3].matched and sigattr_tail[l_0_3].attribute == 16393 then
    l_0_2 = sigattr_tail[l_0_3].utf8p2
    if l_0_2 ~= nil then
      local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_2)
      for l_0_5, l_0_6 in ipairs(l_0_4) do
        l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
        if sysio.IsFileExists(l_0_6) then
          bm.add_related_file(l_0_6)
        end
      end
    end
  end
end
local l_0_7
local l_0_8 = "|.xls|.doc|.ppt|.pps|docx|pptx|ppsx|xlsx|.pdf|.rtf|.one|"
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_7 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_7 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_7 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_7 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_7 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_7 = this_sigattrlog[6].utf8p2
end
if l_0_7 ~= nil then
  local l_0_9 = mp.GetExecutablesFromCommandLine(l_0_7)
  for l_0_10, l_0_11 in ipairs(l_0_9) do
    if sysio.IsFileExists(l_0_11) and string.find(l_0_8, string.sub(l_0_11, -4), 1, true) then
      bm.add_related_file(l_0_11)
    end
  end
end
return mp.INFECTED
