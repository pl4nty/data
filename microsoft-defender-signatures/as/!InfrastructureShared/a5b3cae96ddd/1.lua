-- Threat: !InfrastructureShared
-- Name: a5b3cae96ddd
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil and this_sigattrlog[2].utf8p2 ~= "" then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
end
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  "pdf",
  "doc",
  "docx",
  "xls",
  "xlsx",
  "ppt",
  "pptx",
  "plist",
  "pkg",
  "rtf",
  "txt",
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
local l_0_2 = l_0_0:match("([^/]+)$")
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2:match("%.([^.]+)%.scpt")
if l_0_3 == "" or l_0_3 == nil then
  return mp.CLEAN
end
for l_0_4, l_0_5 in ipairs(l_0_1) do
  if l_0_3 == l_0_5 then
    return mp.INFECTED
  end
end
return mp.CLEAN
