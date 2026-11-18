-- Threat: !InfrastructureShared
-- Name: 25b35d4bf16b
-- Type: 21

local l_0_0 = string.lower(MpCommon.PathToWin32Path(bm.get_imagepath()))
if not string.find(l_0_0, "^c:\\") and not string.find(l_0_0, "^\\\\") then
  return mp.CLEAN
end
if string.find(l_0_0, "\\program files", 1, true) or string.find(l_0_0, "\\programa\\", 1, true) or string.find(l_0_0, "\\programas\\", 1, true) or string.find(l_0_0, "pedeletronico", 1, true) or string.find(l_0_0, "gerencial", 1, true) or string.find(l_0_0, "det.processador", 1, true) then
  return mp.CLEAN
end
local l_0_1 = MpCommon.QueryPersistContext(l_0_0, "ExecutedPENoCert")
if not l_0_1 then
  return mp.CLEAN
end
return mp.INFECTED
