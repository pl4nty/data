-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFXPlatBasFileAV\0x0000134a_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE and l_0_0 ~= mp.SCANREASON_UNKNOWN then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or #l_0_1 < 20 then
  return mp.CLEAN
end
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC45: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC46: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R4 in 'AssignReg'

  for l_0_6,l_0_7 in ("/usr/share/cymulate/av")("/usr/lib/cymulate/av") do
    -- DECOMPILER ERROR at PC50: Overwrote pending register: R8 in 'AssignReg'

    if (("/applications/cymulate/av").find)(l_0_1, l_0_7, 1, true) then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

