-- Threat: !InfrastructureShared
-- Name: !#Lua:Ransom:Win32/Tescrypt!recfile
-- Type: 13

local l_0_0 = mp.getfilesize()
if l_0_0 < 250 or 512 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename()
if ".txt" ~= string.sub(l_0_1, -4) then
  return mp.CLEAN
end
local l_0_2 = headerpage[1]
if 49 ~= l_0_2 and 51 ~= l_0_2 then
  return mp.CLEAN
end
if 13 ~= headerpage[35] and 10 ~= headerpage[36] then
  return mp.CLEAN
end
if nil ~= l_0_1:find("recover_file", 1, true) then
  return mp.INFECTED
end
if nil ~= l_0_1:find("recovery_file", 1, true) then
  return mp.INFECTED
end
if nil ~= l_0_1:find("restore_file", 1, true) then
  return mp.INFECTED
end
if nil ~= l_0_1:find("how_recover", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
