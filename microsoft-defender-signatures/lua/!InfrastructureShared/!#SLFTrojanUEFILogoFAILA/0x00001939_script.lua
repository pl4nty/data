-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanUEFILogoFAILA\0x00001939_luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_UEFISTREAM then
  return mp.CLEAN
end
local l_0_0 = {}
-- DECOMPILER ERROR at PC22: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC23: Overwrote pending register: R1 in 'AssignReg'

-- DECOMPILER ERROR at PC25: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC27: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC29: Overwrote pending register: R4 in 'AssignReg'

do
  local l_0_1 = (("bmpdecoderdxe").getfilename)((("tgadecoderdxe").bitor)(("pngdecoderdxe").FILEPATH_QUERY_FULL, ("jpegdecoderdxe").FILEPATH_QUERY_LOWERCASE))
  for l_0_5,l_0_6 in ipairs(l_0_0) do
    -- DECOMPILER ERROR at PC37: Overwrote pending register: R7 in 'AssignReg'

    -- DECOMPILER ERROR at PC39: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC40: Overwrote pending register: R9 in 'AssignReg'

    if (("amitse").find)("systemimagedecoderdxe", "efioembadgingprotocol", 1, true) then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

