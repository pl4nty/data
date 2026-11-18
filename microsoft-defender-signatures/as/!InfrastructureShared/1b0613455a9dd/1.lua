-- Threat: !InfrastructureShared
-- Name: 1b0613455a9dd
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:NSIS.gen!A") and mp.getfilesize() >= 6000000 and mp.getfilesize() <= 7000000 then
  return mp.INFECTED
end
return mp.CLEAN
