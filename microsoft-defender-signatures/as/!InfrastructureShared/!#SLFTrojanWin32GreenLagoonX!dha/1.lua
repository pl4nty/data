-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32GreenLagoonX!dha\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (MpCommon.PathToWin32Path)((mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE)))
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC23: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC24: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC25: Overwrote pending register: R3 in 'AssignReg'

if ("setlang.exe:go.exe")("setlang.exe:goloc.dll", l_0_1) then
  return mp.INFECTED
end
return mp.CLEAN

