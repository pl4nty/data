-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/PWSH.ShimShady.C
-- Type: 13
-- Includes: BMLuaLib, ResearchData
-- MpAttributes: (RPF:TopLevelFile) & (BM_SDB_FILE)

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_0) or isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {
  ".sysmain.sdb"
}
if contains(l_0_0, l_0_2) then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_3, l_0_4 = pcall(mp.getfilesize)
if not l_0_3 or isnull(l_0_4) then
  return mp.CLEAN
end
l_0_4 = 65536 < l_0_4 and 65536 or l_0_4
local l_0_5 = mp.readfile(0, l_0_4)
if isnull(l_0_5) then
  return mp.CLEAN
end
l_0_5 = tostring(l_0_5)
mp.readprotection(true)
local l_0_6 = {
  "I\000n\000j\000e\000c\000t\000D\000l\000l\000",
  "P\000a\000t\000c\000h\000W\0003\0002\000",
  "P\000a\000t\000c\000h\000W\0006\0004\000",
  "I\000g\000n\000o\000r\000e\000L\000o\000a\000d\000L\000i\000b\000r\000a\000r\000y\000",
  "R\000e\000d\000i\000r\000e\000c\000t\000E\000X\000E\000"
}
local l_0_7 = {"1\192\195", "H1\192\195"}

local function l_0_8(l_1_0, l_1_1)
  for l_1_2, l_1_3 in ipairs(l_1_1) do
    if l_1_0:find(l_1_3, 1, true) then
      return true
    end
  end
  return false
end

if string.find(l_0_5, "sdbf", 1, true) ~= nil and (string.find(l_0_5, "p\000w\000s\000h\000.\000e\000x\000e\000", 1, true) ~= nil or string.find(l_0_5, ".\000p\000w\000s\000h\000", 1, true) ~= nil or string.find(l_0_5, ".\000M\000i\000c\000r\000o\000s\000o\000f\000t\000.\000*\000", 1, true) ~= nil) then
  if l_0_8(l_0_5, l_0_6) then
    set_research_data("[=>] FIX_IDS", tostring(l_0_6), false)
    return mp.INFECTED
  end
  if l_0_8(l_0_5, l_0_7) then
    set_research_data("[=>] FIX_IDS:", tostring(l_0_7), false)
    set_research_data("[=>] FILEPATH:", l_0_0, false)
    set_research_data("[=>] FILENAME:", l_0_1, false)
    return mp.INFECTED
  end
end
return mp.CLEAN
