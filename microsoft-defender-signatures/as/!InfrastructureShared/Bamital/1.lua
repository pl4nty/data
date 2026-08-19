-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Bamital\1.luac 

-- params : ...
-- function num : 0
if (string.match)((Remediation.Threat).Name, "Bamital") then
  if (string.match)((Remediation.Threat).Name, "Virus:Win32/Bamital%.[A-M]") and (MpCommon.GetGlobalMpAttribute)("RPF:Bamital_clean") then
    local l_0_0 = {}
    -- DECOMPILER ERROR at PC43: No list found for R0 , SetList fails

    -- DECOMPILER ERROR at PC44: Overwrote pending register: R1 in 'AssignReg'

    -- DECOMPILER ERROR at PC45: Overwrote pending register: R2 in 'AssignReg'

    for l_0_4,l_0_5 in ("%windir%\\system32\\dll")("%windir%\\system32\\kb.dll") do
      -- DECOMPILER ERROR at PC48: Overwrote pending register: R6 in 'AssignReg'

      -- DECOMPILER ERROR at PC50: Overwrote pending register: R7 in 'AssignReg'

      (("%windir%\\system32\\k.dll").DeleteFile)("%windir%\\system32\\b.dll")
    end
  end
  do
    -- DECOMPILER ERROR at PC55: Overwrote pending register: R0 in 'AssignReg'

    l_0_0("%common_documents%\\win32.dll")
    -- DECOMPILER ERROR at PC58: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC59: Overwrote pending register: R0 in 'AssignReg'

    l_0_0("%common_documents%\\s")
    -- DECOMPILER ERROR at PC62: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC63: Overwrote pending register: R0 in 'AssignReg'

    l_0_0("%windir%\\system32\\drivers\\etc\\hosts")
    -- DECOMPILER ERROR at PC66: Overwrote pending register: R0 in 'AssignReg'

    l_0_0()
    -- DECOMPILER ERROR at PC68: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC69: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC70: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC73: Overwrote pending register: R0 in 'AssignReg'

    -- DECOMPILER ERROR at PC74: Overwrote pending register: R0 in 'AssignReg'

    if l_0_0 then
      l_0_0()
    end
    -- WARNING: undefined locals caused missing assignments!
  end
end

