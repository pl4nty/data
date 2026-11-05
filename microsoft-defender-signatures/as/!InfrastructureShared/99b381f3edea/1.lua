-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\99b381f3edea\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R0 in 'UnsetPending'

  if #l_0_0 < 62 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_1 = (string.lower)(l_0_0)
  local l_0_2 = contains
  local l_0_3 = l_0_1
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC35: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC39: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: Overwrote pending register: R1 in 'AssignReg'

  if l_0_2 then
    return l_0_2
  end
  -- DECOMPILER ERROR at PC42: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC45: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC46: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC48: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC49: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC51: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC52: Overwrote pending register: R11 in 'AssignReg'

  l_0_2, l_0_4 = l_0_2(l_0_3, l_0_4), {"codex", "c:\\programdata\\microsoft", "&echo @", "powershell.exe -noprofile -executionPolicy bypass -file", "\\program files", "reg query", "powershell -executionpolicy bypass -file", "taskkill", "control", "regsvr32", "wscript", "cscript", "javaws", "wmic", "scriptrunner", "certutil", "echo", "start", "runas", "appinstaller", "hh", "ieexec", "installutil", "rpcping", "defaultpack", "msxsl", "squirrel", "update", "winrm"}
  if l_0_2 then
    l_0_2 = bm
    l_0_2 = l_0_2.add_related_string
    -- DECOMPILER ERROR at PC80: Overwrote pending register: R2 in 'AssignReg'

    l_0_4 = tostring
    l_0_4 = l_0_4(l_0_1)
    l_0_2(l_0_3, l_0_4, bm.RelatedStringBMReport)
    l_0_2 = reportSessionInformation
    l_0_2()
    l_0_2 = add_parents
    l_0_2()
    l_0_2 = mp
    l_0_2 = l_0_2.INFECTED
    return l_0_2
  end
  l_0_2 = mp
  l_0_2 = l_0_2.CLEAN
  return l_0_2
end

