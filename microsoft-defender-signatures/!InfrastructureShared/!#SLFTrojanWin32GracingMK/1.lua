-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32GracingMK\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_mpattributevalue)("RPF:GoLang:pclntab_magic_unknown")
if isnull(l_0_0) then
  return mp.CLEAN
end
do
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC17: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC18: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC19: Overwrote pending register: R3 in 'AssignReg'

  for l_0_5,l_0_6 in (4294967280)(4294967291) do
    if (mp.bitand)(l_0_0, l_0_6) ~= l_0_6 then
      local l_0_7 = "Medicated64Sliver"
      local l_0_8 = 3600
      local l_0_9 = 1
      AppendToRollingQueue(l_0_7, "Gracingmagik", 1, l_0_8, l_0_9)
      if (mp.IsTrustedFile)(false) == true then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

