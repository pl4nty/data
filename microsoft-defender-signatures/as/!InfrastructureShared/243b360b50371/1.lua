-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\243b360b50371\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0)
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC30: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC32: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC33: Overwrote pending register: R5 in 'AssignReg'

  if ("/code")("/cursor", "/windsurf") then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC43: Overwrote pending register: R6 in 'AssignReg'

  TrackPidAndTechniqueBM("BM", "T1565.001", "/node")
  add_parents()
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

