-- Threat: !InfrastructureShared
-- Name: 37292a9724aa
-- Type: 21

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("stress", 1, true) or l_0_0:find("wasm-module-builder", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
