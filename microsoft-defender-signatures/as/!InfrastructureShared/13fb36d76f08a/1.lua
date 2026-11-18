-- Threat: !InfrastructureShared
-- Name: 13fb36d76f08a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
local l_0_1 = l_0_0.command_line
local l_0_2 = bm.get_imagepath()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5
local l_0_6 = {
  "pdf",
  "doc",
  "docx",
  "xls",
  "xlsx",
  "ppt",
  "pptx",
  "rtf",
  "txt",
  "one",
  "jpg",
  "jpeg",
  "png",
  "bmp",
  "gif",
  "mov",
  "mp4",
  "mp3",
  "avi",
  "wmv",
  "flv",
  "mpg",
  "mpeg"
}
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil and this_sigattrlog[3].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil and this_sigattrlog[4].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil and this_sigattrlog[5].utf8p2 ~= "" then
  l_0_3 = this_sigattrlog[5].utf8p2
end
if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil and this_sigattrlog[7].utf8p1 ~= "" then
  l_0_5 = this_sigattrlog[7].utf8p1
end
if l_0_3 == nil or l_0_3 == "" or l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
l_0_4 = string.match(l_0_5, "[^/]*$")
if string.find(l_0_3, l_0_4, 1, true) and (l_0_4:match("[^.+%.].+%.zip$") or l_0_4:match("[^.+%.].+%.dmg$") or l_0_4:match("[^.+%.].+%.pkg$")) then
  local l_0_7 = l_0_4:match("[^.+]%.(.+)%.+")
  for l_0_8, l_0_9 in pairs(l_0_6) do
    if l_0_7 == l_0_9 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
