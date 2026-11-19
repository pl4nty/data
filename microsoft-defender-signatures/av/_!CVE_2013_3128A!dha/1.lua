-- Threat: \xd0!CVE_2013_3128.A!dha
-- Type: 13
-- MpAttributes: BM_FONT_FILE

local l_0_0 = mp.getfilesize()
if 8192 < l_0_0 and l_0_0 < 131072 then
  mp.readprotection(false)
  local l_0_1 = mp.readfile(0, l_0_0)
  local l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "This program cannot be run in DOS mode.")
  if not l_0_2 then
    return mp.CLEAN
  end
  local l_0_5 = string.lower(mp.getfilename())
  if string.find(l_0_5, ".fon", 1, true) ~= nil or string.find(l_0_5, ".ttf", 1, true) ~= nil or string.find(l_0_5, ".otf", 1, true) ~= nil then
    return mp.LOWFI
  end
end
return mp.CLEAN
