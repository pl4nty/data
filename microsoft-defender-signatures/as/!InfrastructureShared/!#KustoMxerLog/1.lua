-- Threat: !InfrastructureShared
-- Name: !#KustoMxerLog
-- Type: 13
-- MpAttributes: BM_ZIP_FILE

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH) or ""
if nil ~= l_0_0:lower():find("kustomultiplexer\\ingestions") then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME) or ""
  if l_0_1:lower():sub(-4) == ".zip" then
    return mp.INFECTED
  end
end
return mp.CLEAN
