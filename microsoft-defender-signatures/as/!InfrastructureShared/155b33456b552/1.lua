-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\155b33456b552\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC7: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[4]).matched then
    local l_0_0, l_0_1, l_0_2 = nil
  else
  end
  if not (this_sigattrlog[5]).matched or (this_sigattrlog[5]).ppid == nil then
    return mp.CLEAN
  end
  local l_0_3 = nil
  local l_0_4 = {}
  local l_0_5 = {"node", "npm-cli.js"}
  local l_0_6 = {"node", "npx-cli.js"}
  -- DECOMPILER ERROR at PC35: No list found for R1 , SetList fails

  l_0_5 = checkParentCmdline
  l_0_6 = l_0_3
  -- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

  l_0_5 = l_0_5(l_0_6, {"", "npm install"}, 5)
  if l_0_5 then
    l_0_5 = add_parents
    l_0_5()
    l_0_5 = mp
    l_0_5 = l_0_5.INFECTED
    return l_0_5
  end
  l_0_5 = mp
  l_0_5 = l_0_5.CLEAN
  return l_0_5
end

