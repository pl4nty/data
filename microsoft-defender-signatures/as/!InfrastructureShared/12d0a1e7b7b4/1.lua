-- Threat: !InfrastructureShared
-- Name: 12d0a1e7b7b4
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "->(Ole Stream", -18, true) == nil then
  return mp.CLEAN
end
local l_0_1 = mp.BMSearchFile(7, 5, "\235G\n\001\005\144\000")
if l_0_1 ~= 0 then
  return mp.CLEAN
end
mp.UfsSetMetadataBool("OleShellCode", true)
return mp.INFECTED
