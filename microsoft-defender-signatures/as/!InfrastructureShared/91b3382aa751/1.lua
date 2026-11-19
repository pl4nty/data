-- Threat: !InfrastructureShared
-- Name: 91b3382aa751
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2, l_0_3
l_0_1 = string.lower(l_0_0):match("([^\\]+)$")
if not l_0_1 then
  return mp.CLEAN
end
if l_0_1 == "w3wp.exe" then
  local l_0_4 = bm.get_current_process_startup_info()
  local l_0_5 = string.lower(l_0_4.command_line):match("-ap \"([^\"]+)\"")
  if l_0_5 == nil then
    l_0_2 = "nil"
  else
    l_0_2 = l_0_5
  end
  l_0_3 = true
end
local l_0_6, l_0_7
if this_sigattrlog[7].matched then
  l_0_6 = this_sigattrlog[7].utf8p2
end
if l_0_6 ~= nil then
  l_0_7 = string.format("%s;%s;%s", l_0_1, l_0_2, l_0_6)
  bm.add_related_string("ExchgCompromise", l_0_7, bm.RelatedStringBMReport)
  bm.set_detection_string(l_0_7)
  return mp.INFECTED
end
local l_0_8
local l_0_9 = "\\.(asp|aspx|ashx|asmx)$"
for l_0_10 = mp.SIGATTR_LOG_SZ, 1, -1 do
  local l_0_11 = sigattr_tail[l_0_10]
  if l_0_11.matched and (l_0_11.attribute == 16384 or l_0_11.attribute == 16385) and l_0_11.utf8p1 then
    l_0_8 = string.lower(l_0_11.utf8p1):match("(\\[^\\]+\\[^\\]+)$")
    local l_0_12, l_0_13 = MpCommon.StringRegExpSearch(l_0_9, l_0_8)
    if l_0_12 then
      break
    end
  end
end
if not l_0_8 then
  bm.add_related_string("FileExtractErr", "true", bm.RelatedStringBMReport)
  return mp.INFECTED
end
if l_0_3 then
  l_0_7 = string.format("%s;%s;%s", l_0_1, l_0_2, l_0_8)
else
  l_0_7 = string.format("%s;%s", l_0_1, l_0_8)
end
bm.add_related_string("ExchgCompromise", l_0_7, bm.RelatedStringBMReport)
return mp.INFECTED
