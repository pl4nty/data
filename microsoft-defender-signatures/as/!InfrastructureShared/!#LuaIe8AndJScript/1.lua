-- Threat: !InfrastructureShared
-- Name: !#Lua:Ie8AndJScript
-- Type: 24
-- MpAttributes: SCPT:ForceIe8.A & SCPT:HTMLUsingJscript.A

local l_0_0 = mp.getfilesize()
if l_0_0 < 400 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1:find("fuzz", 1, true) or l_0_1:find("exploitdb", 1, true) or l_0_1:find("helloworld", 1, true) or l_0_1:find("grizzly\\serve", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
