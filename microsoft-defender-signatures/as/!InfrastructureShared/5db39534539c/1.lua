-- Threat: !InfrastructureShared
-- Name: 5db39534539c
-- Type: 21
-- Includes: BMLuaLib

if not this_sigattrlog[1].matched or this_sigattrlog[1].utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
local l_0_1 = string.match(l_0_0, "filepath=([^&]+)")
if not l_0_1 or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {
  "\\users\\",
  "\\desktop\\",
  "\\downloads\\",
  "\\documents\\",
  "\\appdata\\",
  "\\temp\\",
  "\\public\\",
  "\\windows\\",
  "\\program files\\",
  "\\program files (x86)\\",
  "\\programdata\\",
  "\\system32\\",
  "\\syswow64\\",
  "\\onedrive\\",
  "\\onedrive - ",
  "c:\\",
  ":\\",
  "file:///",
  "ms-screenclip:"
}
if contains(l_0_0, l_0_2, true) then
  return mp.CLEAN
end
return mp.INFECTED
