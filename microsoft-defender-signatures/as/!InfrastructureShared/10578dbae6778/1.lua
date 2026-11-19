-- Threat: !InfrastructureShared
-- Name: 10578dbae6778
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:GoMainFunc") and mp.get_mpattribute("LUA:FileSizeGT12M.A") then
  return mp.INFECTED
end
return mp.CLEAN
