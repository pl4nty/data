-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_AFakeUpdateSAS\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = {}
-- DECOMPILER ERROR at PC14: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC15: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC16: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC17: Overwrote pending register: R4 in 'AssignReg'

if ("^uрdateinstаller%.zip$")("^uрdate%.js$", "^update_[0-9]+%.js$", false) then
  return mp.INFECTED
end
return mp.CLEAN

