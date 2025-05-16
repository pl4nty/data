-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaSenseIRCretaeFileinTemp\0x00001ac6_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  l_0_1 = (MpCommon.PathToWin32Path)(l_0_1)
  if l_0_1 == nil or l_0_1 == "" then
    return mp.CLEAN
  end
  l_0_1 = (string.lower)(l_0_1)
  if not (string.find)(l_0_1, "\\windows\\temp\\", 1, true) then
    return mp.CLEAN
  end
  local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
  local l_0_3 = {}
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC68: No list found for R4 , SetList fails

  local l_0_5 = {}
  -- DECOMPILER ERROR at PC70: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC73: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC77: Overwrote pending register: R7 in 'AssignReg'

  l_0_4 = l_0_4(l_0_5, "\\programdata\\microsoft\\windows defender advanced threat protection\\", "\\program files\\windows defender advanced threat protection\\")
  if l_0_4 then
    l_0_4 = mp
    l_0_4 = l_0_4.INFECTED
    return l_0_4
  end
  l_0_4 = "senseir.exe"
  -- DECOMPILER ERROR at PC85: Overwrote pending register: R5 in 'AssignReg'

  l_0_5 = l_0_5(l_0_2, l_0_4, 5)
  if l_0_5 and l_0_2 then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

