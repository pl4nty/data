-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFAnomalyTableTelemetry\1_luac 

-- params : ...
-- function num : 0
if (mp.GetResmgrBasePlugin)() ~= "Regkeyvalue" then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH)
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC43: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC44: Overwrote pending register: R2 in 'AssignReg'

do
  local l_0_2 = "Appomaly_ChildProcName"
  -- DECOMPILER ERROR at PC45: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC46: Overwrote pending register: R4 in 'AssignReg'

  for l_0_6,l_0_7 in ("Appomaly_ChildProcPriv")("Appomaly_ParentProcName") do
    -- DECOMPILER ERROR at PC49: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC51: Overwrote pending register: R9 in 'AssignReg'

    local l_0_8 = (("Appomaly_ChildProcName_CmdLine").AnomalyTableLookup)("Appomaly_Global_CmdLine")
    -- DECOMPILER ERROR at PC61: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC62: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC64: Overwrote pending register: R12 in 'AssignReg'

    -- DECOMPILER ERROR at PC65: Overwrote pending register: R13 in 'AssignReg'

    if l_0_8 then
      set_research_data("Appomaly_ChildProcName_CmdLine_Base64", (("Appomaly_File_Directory").Base64Encode)(("Appomaly_File_Name")("Appomaly_File_Extension")), false)
    end
  end
  set_research_data("Tables_Count", l_0_2, false)
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

