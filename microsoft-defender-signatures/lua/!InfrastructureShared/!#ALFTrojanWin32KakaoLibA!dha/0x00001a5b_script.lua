-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin32KakaoLibA!dha\0x00001a5b_luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC17: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC18: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("listcmdreplyfiles").getfilesize)()
-- DECOMPILER ERROR at PC25: Overwrote pending register: R2 in 'AssignReg'

if l_0_1 < 512000 or l_0_1 > 2097152 then
  return ("deletecmdreplyfile").CLEAN
end
local l_0_2, l_0_3 = (pe.get_exports)(), "listcmdsendfiles"
-- DECOMPILER ERROR at PC31: Overwrote pending register: R4 in 'AssignReg'

local l_0_4 = "listdatafiles"
-- DECOMPILER ERROR at PC36: Overwrote pending register: R5 in 'AssignReg'

if l_0_2 < 50 or l_0_2 > 80 then
  return ("deletedatafile").CLEAN
end
-- DECOMPILER ERROR at PC40: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC41: Overwrote pending register: R7 in 'AssignReg'

for l_0_8 = 1, "downloadloginbuffer", "downloaddatafile" do
  -- DECOMPILER ERROR at PC43: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC45: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R11 in 'AssignReg'

  local l_0_9 = (("initcloudcredential").mmap_string_rva)(("getclouderrasstring").namerva, "deletecmdfile")
  if l_0_9 ~= nil then
    for l_0_13,l_0_14 in ipairs(l_0_0) do
      -- DECOMPILER ERROR at PC55: Overwrote pending register: R15 in 'AssignReg'

      -- DECOMPILER ERROR at PC57: Overwrote pending register: R16 in 'AssignReg'

      if not (("downloadcmdreplyfile").match)((("uploadcmdbuffer").lower)(l_0_9), l_0_14) or l_0_4 > 10 then
        return mp.INFECTED
      end
    end
  end
end
do return mp.CLEAN end
-- DECOMPILER ERROR at PC77: Confused about usage of register R5 for local variables in 'ReleaseLocals'

-- WARNING: undefined locals caused missing assignments!

