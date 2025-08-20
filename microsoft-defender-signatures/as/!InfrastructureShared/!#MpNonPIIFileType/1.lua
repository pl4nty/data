-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#MpNonPIIFileType\1.luac 

-- params : ...
-- function num : 0
do
  local l_0_0 = {}
  -- DECOMPILER ERROR at PC17: No list found for R0 , SetList fails

  -- DECOMPILER ERROR at PC18: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC19: Overwrote pending register: R2 in 'AssignReg'

  for l_0_4,l_0_5 in ("ALFPER:Trojan:Win32/Mscoree.mui!dha")("ALFPER:Trojan:Win64/OpenUp.B!dha") do
    -- DECOMPILER ERROR at PC22: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC24: Overwrote pending register: R7 in 'AssignReg'

    if (("ALF:Trojan:Win32/ChocoFrag.B!dha").get_mpattribute)("ALFPER:Trojan:Win32/ChocoFrag.C!dha") then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

