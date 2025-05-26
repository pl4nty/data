-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32ETWShimShadyAL\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_0) or isnull(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC30: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

if (".sysmain.sdb")(l_0_0, l_0_2) then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_3, l_0_4 = pcall(mp.getfilesize)
if not l_0_3 or isnull(l_0_4) then
  return mp.CLEAN
end
if l_0_4 <= 65536 or not 65536 then
  local l_0_5 = (mp.readfile)(0, l_0_4)
  if isnull(l_0_5) then
    return mp.CLEAN
  end
  l_0_5 = tostring(l_0_5)
  ;
  (mp.readprotection)(true)
  local l_0_6 = {}
  -- DECOMPILER ERROR at PC90: No list found for R6 , SetList fails

  local l_0_7 = {}
  -- DECOMPILER ERROR at PC92: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC93: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: No list found for R7 , SetList fails

  -- DECOMPILER ERROR at PC95: Overwrote pending register: R8 in 'AssignReg'

  local l_0_8 = "P\000a\000t\000c\000h\000W\0003\0002\000"
  -- DECOMPILER ERROR at PC96: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC98: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC99: Overwrote pending register: R11 in 'AssignReg'

  if (("P\000a\000t\000c\000h\000W\0006\0004\000").find)("I\000g\000n\000o\000r\000e\000L\000o\000a\000d\000L\000i\000b\000r\000a\000r\000y\000", "R\000e\000d\000i\000r\000e\000c\000t\000E\000X\000E\000", 1, true) ~= nil and (string.find)(l_0_5, "n\000t\000d\000l\000l\000.\000d\000l\000l\000", 1, true) ~= nil then
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
end

