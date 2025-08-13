-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFSuspiciousDLLMissingExportsPrtProcA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "SuspiciousDLL.PrtProc.Exports"
local l_0_1 = 6
local l_0_2 = {}
l_0_2.ClosePrintProcessor = true
l_0_2.ControlPrintProcessor = true
l_0_2.EnumPrintProcessorDatatypes = true
l_0_2.GetPrintProcessorCapabilities = true
l_0_2.OpenPrintProcessor = true
l_0_2.PrintDocumentOnPrintProcessor = true
local l_0_3 = (MpCommon.PathToWin32Path)((mp.getfilename)())
local l_0_4, l_0_5 = (pe.get_exports)()
if not l_0_3 or not l_0_5 or l_0_4 == 0 then
  return mp.CLEAN
end
local l_0_6 = 0
local l_0_7 = {}
for l_0_11 = 1, l_0_4 do
  local l_0_12 = (pe.mmap_string_rva)((l_0_5[l_0_11]).namerva, 64)
  if not l_0_2[l_0_12] or not 1 then
    do
      l_0_6 = l_0_6 + (l_0_12 == nil or 0)
      ;
      (table.insert)(l_0_7, l_0_12)
      -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out IF_THEN_STMT

      -- DECOMPILER ERROR at PC54: LeaveBlock: unexpected jumping out IF_STMT

    end
  end
end
AppendToRollingQueue(l_0_0, (string.lower)(l_0_3), (string.format)("Count=%d_List=%s_MissingReq=%d/%d", l_0_4, (table.concat)(l_0_7, ","), l_0_1 - (l_0_6), l_0_1))
if l_0_1 == l_0_6 then
  return mp.CLEAN
end
return mp.INFECTED

