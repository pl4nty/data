-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\ExcludeProc\0x000018ed_luac 

-- params : ...
-- function num : 0
local l_0_0 = "HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\"
local l_0_1 = (sysio.RegOpenKey)(l_0_0 .. "Extensions")
do
  if l_0_1 then
    local l_0_2 = {}
    -- DECOMPILER ERROR at PC12: No list found for R2 , SetList fails

    -- DECOMPILER ERROR at PC13: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC14: Overwrote pending register: R4 in 'AssignReg'

    ;
    ("exe")("dll", l_0_2)
  end
  local l_0_3 = (sysio.RegOpenKey)(l_0_0 .. "Paths")
  do
    if l_0_3 then
      local l_0_4 = {}
      -- DECOMPILER ERROR at PC32: No list found for R3 , SetList fails

      -- DECOMPILER ERROR at PC33: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC34: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC39: Overwrote pending register: R6 in 'AssignReg'

      DeleteRegistryEntriesOnValueMatch(l_0_3, "%appdata%")
    end
    -- DECOMPILER ERROR at PC41: Overwrote pending register: R3 in 'AssignReg'

    local l_0_5 = (l_0_4.RegOpenKey)(l_0_0 .. "Processes")
    do
      if l_0_5 then
        local l_0_6 = {}
        -- DECOMPILER ERROR at PC52: No list found for R4 , SetList fails

        -- DECOMPILER ERROR at PC53: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC54: Overwrote pending register: R6 in 'AssignReg'

        -- DECOMPILER ERROR at PC55: Overwrote pending register: R7 in 'AssignReg'

        ;
        ("c:\\windows\\system32\\windowspowershell\\v1.0\\powershell.exe")("powershell.exe", "%systemroot%")
      end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

