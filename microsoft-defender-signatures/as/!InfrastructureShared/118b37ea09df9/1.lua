-- Threat: !InfrastructureShared
-- Name: 118b37ea09df9
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line or ""
local l_0_2 = bm.get_imagepath() or ""
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2)
local l_0_4 = string.lower(l_0_1)
if l_0_3:find("/.local/share/claude/versions/", 1, true) or l_0_3:find("/@anthropic-ai/claude-code/", 1, true) or l_0_3:find("^/opt/homebrew/caskroom/claude%-code[^/]*/", 1, false) or l_0_3:find("anthropic.claude-code-", 1, true) or l_0_3 == "/usr/bin/security" and l_0_4:find("find-certificate", 1, true) or l_0_3 == "/usr/bin/sudo" and l_0_4:find("/library/application support/jamf/jamf.app/", 1, true) and l_0_4:find("getpssostatus", 1, true) or l_0_3:find("^/opt/homebrew/cellar/gh/", 1, false) or l_0_3:find("^/opt/homebrew/cellar/glab/", 1, false) or l_0_3:find("/ms-playwright/", 1, true) or l_0_3:find("/playwright/driver/node", 1, true) or l_0_3:find("^/applications/google chrome%.app/contents/macos/google chrome", 1, false) or l_0_3:find("^/applications/microsoft edge%.app/contents/macos/microsoft edge", 1, false) then
  return mp.CLEAN
end
if this_sigattrlog[3].matched and this_sigattrlog[3].wp2 ~= nil then
  return mp.INFECTED
end
local l_0_5, l_0_6 = bm.get_process_relationships()
for l_0_7, l_0_8 in ipairs(l_0_5) do
  if l_0_8.image_path ~= nil and (string.find(l_0_8.image_path, "python", 1, true) or string.find(l_0_8.image_path, "perl", 1, true) or string.find(l_0_8.image_path, "osascript", 1, true)) then
    return mp.INFECTED
  end
end
return mp.CLEAN
