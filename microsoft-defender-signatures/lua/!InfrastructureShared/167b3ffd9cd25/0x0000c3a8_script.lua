-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\167b3ffd9cd25\0x0000c3a8_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p1 ~= nil then
  local l_0_0 = (string.match)((this_sigattrlog[1]).utf8p2, ";vmbaseaddress:(%d+)")
  if l_0_0 == nil then
    return mp.CLEAN
  end
  local l_0_1 = (mp.bitand)((mp.shr64)(l_0_0, 24), 16777215)
  if l_0_1 == nil or l_0_1 == 0 then
    return mp.CLEAN
  end
  local l_0_2 = (this_sigattrlog[1]).utf8p1
  local l_0_3, l_0_4 = (string.match)(l_0_2, "targetprocessppid:(%d+):(%d+)")
  if not l_0_3 or not l_0_4 then
    return mp.CLEAN
  end
  local l_0_5 = (string.format)("pid:%s,ProcessStart:%s", l_0_3, l_0_4)
  local l_0_6, l_0_7 = (bm.get_process_relationships)()
  local l_0_8 = table_ipairs_filter
  local l_0_9 = l_0_7
  local l_0_10 = {}
  -- DECOMPILER ERROR at PC70: No list found for R10 , SetList fails

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC81: Overwrote pending register: R8 in 'AssignReg'

  if l_0_8 or l_0_7 == 0 then
    return l_0_8
  end
  -- DECOMPILER ERROR at PC83: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC84: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC85: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC87: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC91: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC96: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC97: Overwrote pending register: R10 in 'AssignReg'

  if not l_0_8 or l_0_10 then
    return l_0_10
  end
  -- DECOMPILER ERROR at PC99: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC100: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC102: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC103: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC104: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC112: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC113: Overwrote pending register: R11 in 'AssignReg'

  if l_0_10 == nil or l_0_10 == 0 then
    return R11_PC93
  end
  -- DECOMPILER ERROR at PC117: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC118: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC121: Overwrote pending register: R14 in 'AssignReg'

  if l_0_1 == l_0_10 then
    R11_PC93("BMGenericCodeInjector.A", "Behavior:Win32/GenCodeInjector.F", l_0_5)
    -- DECOMPILER ERROR at PC123: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC124: Overwrote pending register: R11 in 'AssignReg'

    return R11_PC93
  end
end
do
  return mp.CLEAN
end

