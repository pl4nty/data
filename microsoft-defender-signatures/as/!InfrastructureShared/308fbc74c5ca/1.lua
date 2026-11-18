-- Threat: !InfrastructureShared
-- Name: 308fbc74c5ca
-- Type: 21

if mp.get_mpattribute("AGGR:ExcelFormulaRoutines") and mp.get_mpattribute("LUA:FileSizeLE40000.A") then
  return mp.INFECTED
end
return mp.CLEAN
