-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2e9b3e256f8f8\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[8]).matched and (this_sigattrlog[8]).utf8p2 ~= nil then
  local l_0_0 = nil
  -- DECOMPILER ERROR at PC15: Overwrote pending register: R1 in 'AssignReg'

  local l_0_2 = nil
end
do
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

  if not l_0_0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R1 in 'UnsetPending'

  if not l_0_2 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC26: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = l_0_0:lower()
  local l_0_3 = nil
  if not l_0_1:match("node%.exe\"?%s+\"?([^\"]+%.js)\"?") then
    return mp.CLEAN
  end
  if checkFileLastWriteTime(l_0_1:match("node%.exe\"?%s+\"?([^\"]+%.js)\"?"), 3600) ~= false then
    return mp.CLEAN
  end
  if checkFileLastWriteTime(l_0_3, 3600) ~= false then
    return mp.CLEAN
  end
  ;
  (bm.add_related_file)(l_0_1:match("node%.exe\"?%s+\"?([^\"]+%.js)\"?"))
  return mp.INFECTED
end

