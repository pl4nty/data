-- Threat: !InfrastructureShared
-- Name: d6b3105e5af8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if not string.find(l_0_2, "com.apple.webkit.networking", 1, true) and not string.find(l_0_2, "com.apple.safari.sandboxbroker", 1, true) and (IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2)) then
  return mp.CLEAN
end
local l_0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_3 = this_sigattrlog[5].utf8p2
else
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_3)
if string.find(l_0_4, "/bin/", 1, true) == 1 or string.find(l_0_4, "/system/", 1, true) == 1 or string.find(l_0_4, "/library/apple/", 1, true) == 1 or string.find(l_0_4, "/library/installersandboxes/", 1, true) == 1 or string.find(l_0_4, "/.git/modules/", 1, true) or string.find(l_0_4, "/.git/hooks/", 1, true) or string.find(l_0_4, "/sbin/", 1, true) == 1 or string.find(l_0_4, "/private/var/db/com.apple.xpc.roleaccountd.staging", 1, true) == 1 or string.find(l_0_4, "/private/var/folders/", 1, true) == 1 or string.find(l_0_4, "/usr/", 1, true) == 1 and not string.find(l_0_4, "/usr/local/", 1, true) == 1 or string.find(l_0_4, "/applications/microsoft defender.app/", 1, true) == 1 then
  return mp.CLEAN
end
local l_0_5 = l_0_3:match("[^/]*$")
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
local l_0_6 = l_0_5:match("(.+)%..+")
if l_0_6 == nil or l_0_6 == "" then
  l_0_6 = l_0_5
end
local l_0_7 = string.lower(l_0_6)
local l_0_8 = l_0_7:gsub("%W", "")
local l_0_9 = {
  "visualstudio",
  "adobe",
  "flash",
  "update",
  "patch",
  "celastradepro",
  "jobinfo",
  "chrome",
  "pdf",
  "discord",
  "word",
  "excel",
  "onenote",
  "edge",
  "outlook",
  "powerpoint",
  "teams",
  "remote",
  "calendar",
  "calculator",
  "itunes",
  "imovie",
  "facetime",
  "launchpad",
  "maps",
  "numbers",
  "ondrive",
  "reminder",
  "safari",
  "mail",
  "photos",
  "time machine",
  "desktop",
  "magnet",
  "alfred",
  "pdf expert",
  "disk drill",
  "cleverfile",
  "miner",
  "telegram",
  "teamspeak",
  "element",
  "mumble",
  "guilded",
  "apple",
  "mozilla",
  "oracle",
  "xpcservice",
  "microsoft",
  "launch",
  "zoom",
  "copilot",
  "google meet",
  "coscreen",
  "gitsi",
  "goto",
  "webex",
  "firefox",
  "interview",
  "jobdescription"
}
for l_0_10, l_0_11 in pairs(l_0_9) do
  if l_0_8 == l_0_11 then
    return mp.INFECTED
  end
end
return mp.CLEAN
