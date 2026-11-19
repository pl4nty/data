-- Threat: !InfrastructureShared
-- Name: 99b39ec30842
-- Type: 21

local l_0_0
if this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
elseif this_sigattrlog[6].matched then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
end
if not l_0_0:match("\\windows\\sysvol\\domain\\policies\\{%w%w%w%w%w%w%w%w%-%w%w%w%w%-%w%w%w%w%-%w%w%w%w%-%w%w%w%w%w%w%w%w%w%w%w%w}\\") then
  return mp.CLEAN
end
local l_0_1 = "[\000S\000o\000f\000t\000w\000a\000r\000e\000\\\000P\000o\000l\000i\000c\000i\000e\000s\000\\\000M\000i\000c\000r\000o\000s\000o\000f\000t\000\\\000W\000i\000n\000d\000o\000w\000s\000 \000D\000e\000f\000e\000n\000d\000e\000r\000\\\000R\000e\000a\000l\000-\000T\000i\000m\000e\000 \000P\000r\000o\000t\000e\000c\000t\000i\000o\000n\000\000\000;\000D\000i\000s\000a\000b\000l\000e\000R\000e\000a\000l\000t\000i\000m\000e\000M\000o\000n\000i\000t\000o\000r\000i\000n\000g\000\000\000;\000"
local l_0_2 = "[\000S\000o\000f\000t\000w\000a\000r\000e\000\\\000P\000o\000l\000i\000c\000i\000e\000s\000\\\000M\000i\000c\000r\000o\000s\000o\000f\000t\000\\\000W\000i\000n\000d\000o\000w\000s\000 \000D\000e\000f\000e\000n\000d\000e\000r\000\000\000;\000D\000i\000s\000a\000b\000l\000e\000A\000n\000t\000i\000S\000p\000y\000w\000a\000r\000e\000\000\000;\000"
local l_0_3 = sysio.GetFileSize(l_0_0)
if 50000 < l_0_3 then
  return mp.CLEAN
end
local l_0_4 = tostring(sysio.ReadFile(l_0_0, 0, l_0_3))
local l_0_5, l_0_6 = string.find(l_0_4, l_0_1, 1, true)
if l_0_5 == nil or l_0_6 == nil then
  l_0_5, l_0_6 = string.find(l_0_4, l_0_2, 1, true)
  if l_0_5 == nil or l_0_6 == nil then
    return mp.CLEAN
  end
end
if mp.readu_u16(l_0_4, l_0_6 + 5) == 59 and mp.readu_u16(l_0_4, l_0_6 + 5 + 6) == 59 and mp.readu_u32(l_0_4, l_0_6 + 5 + 6 + 2) == 1 then
  if sysio.IsFileExists(l_0_0) then
    bm.add_related_file(l_0_0)
  end
  return mp.INFECTED
end
return mp.CLEAN
