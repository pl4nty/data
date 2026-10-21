-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\67b30e1cc766\1.luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[2]).matched then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[2]).utf8p1
local l_0_1 = (this_sigattrlog[2]).utf8p2
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.match)(l_0_0, "([^/]+)$")
if l_0_2 ~= "sh" and l_0_2 ~= "bash" and l_0_2 ~= "dash" then
  return mp.CLEAN
end
local l_0_3 = containsall
local l_0_4 = l_0_1
do
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC50: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC54: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC55: Overwrote pending register: R3 in 'AssignReg'

  if not l_0_3 then
    return l_0_3
  end
  -- DECOMPILER ERROR at PC57: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC58: Overwrote pending register: R3 in 'AssignReg'

  do return l_0_3 end
  -- WARNING: undefined locals caused missing assignments!
end

