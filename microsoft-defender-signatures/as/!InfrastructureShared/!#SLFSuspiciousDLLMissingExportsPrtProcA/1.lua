-- Threat: !InfrastructureShared
-- Name: !#SLF:SuspiciousDLL.MissingExports.PrtProc.A
-- Type: 10
-- Includes: LuaFuncHelper
-- MpAttributes: AGGR:Context/DLL.PrtProc.A & MpTrustCheck_NotDigitallySigned & Lua:FileCreatedLT1d

local l_0_0 = "SuspiciousDLL.PrtProc.Exports"
local l_0_1 = 6
local l_0_2 = {
  ClosePrintProcessor = true,
  ControlPrintProcessor = true,
  EnumPrintProcessorDatatypes = true,
  GetPrintProcessorCapabilities = true,
  OpenPrintProcessor = true,
  PrintDocumentOnPrintProcessor = true
}
local l_0_3 = MpCommon.PathToWin32Path(mp.getfilename())
local l_0_4, l_0_5 = pe.get_exports()
if not (l_0_3 and l_0_5) or l_0_4 == 0 then
  return mp.CLEAN
end
local l_0_6 = 0
local l_0_7 = {}
for l_0_8 = 1, l_0_4 do
  local l_0_9 = pe.mmap_string_rva(l_0_5[l_0_8].namerva, 64)
  if l_0_9 ~= nil then
    l_0_6 = l_0_6 + (l_0_2[l_0_9] and 1 or 0)
    table.insert(l_0_7, l_0_9)
  end
end
AppendToRollingQueue(l_0_0, string.lower(l_0_3), string.format("Count=%d_List=%s_MissingReq=%d/%d", l_0_4, table.concat(l_0_7, ","), l_0_1 - l_0_6, l_0_1))
if l_0_1 == l_0_6 then
  return mp.CLEAN
end
return mp.INFECTED
