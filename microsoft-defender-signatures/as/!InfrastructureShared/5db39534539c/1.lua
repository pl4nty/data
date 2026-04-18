-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5db39534539c\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_0 = (string.lower)((this_sigattrlog[1]).utf8p2)
local l_0_1 = (string.match)(l_0_0, "filepath=([^&]+)")
if not l_0_1 or l_0_1 == "" then
  return mp.CLEAN
end
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC51: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC52: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC53: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC54: Overwrote pending register: R5 in 'AssignReg'

  if ("\\users\\")("\\desktop\\", "\\downloads\\", true) then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

