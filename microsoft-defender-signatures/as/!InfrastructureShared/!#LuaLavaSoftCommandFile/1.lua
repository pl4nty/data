-- Threat: !InfrastructureShared
-- Name: !#Lua:LavaSoftCommandFile
-- Type: 13
-- MpAttributes: NID:LavaSoftCommandFile

if string.len(mp.getfilename()) == 15 then
  return mp.INFECTED
end
return mp.CLEAN
