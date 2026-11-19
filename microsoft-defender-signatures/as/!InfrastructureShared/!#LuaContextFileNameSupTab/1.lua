-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextFileNameSupTab
-- Type: 9

local l_0_0 = string.lower(mp.getfilename())
local l_0_1, l_0_2 = l_0_0:match("(.+\\)([^\\]+)$")
if l_0_2 == nil or l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1:len() < 6 then
  return mp.CLEAN
end
local l_0_3 = l_0_2:len()
if 10 < l_0_3 and l_0_2:find("^wpm_v.+%.exe$") == 1 then
  mp.set_mpattribute("Lua:ContextFileNameSupTab.A")
elseif 10 < l_0_3 and l_0_2:find("^minilite_v.+%.exe$") == 1 then
  mp.set_mpattribute("Lua:ContextFileNameSupTab.B")
elseif l_0_2 == "oursurfing.exe" then
  mp.set_mpattribute("Lua:ContextFileNameSupTab.C")
elseif 8 < l_0_3 and l_0_2:find("^amt_.+%.exe$") == 1 and l_0_1:find("\\temp\\", 1, true) ~= nil and l_0_2 ~= "amt_util.exe" then
  mp.set_mpattribute("Lua:ContextFileNameSupTab.D")
elseif l_0_2 == "protectservice.exe" then
  mp.set_mpattribute("Lua:ContextFileNameSupTab.E")
elseif l_0_2 == "winmanpro.exe" then
  mp.set_mpattribute("Lua:ContextFileNameSupTab.F")
elseif l_0_2 == "ihpmserver.exe" then
  mp.set_mpattribute("Lua:ContextFileNameSupTab.G")
elseif l_0_2 == "raydld.exe" then
  mp.set_mpattribute("Lua:ContextFileNameSupTab.H")
elseif 10 < l_0_3 and l_0_2:find("^ray_v.+%.exe$") == 1 or 10 < l_0_3 and l_0_2:find("^ray_%d.+%.exe$") == 1 then
  mp.set_mpattribute("Lua:ContextFileNameSupTab.I")
elseif l_0_2 == "ssfk.exe" then
  mp.set_mpattribute("Lua:ContextFileNameSupTab.J")
elseif 10 < l_0_3 and l_0_2:find("^ssfk_v.+%.exe$") == 1 then
  mp.set_mpattribute("Lua:ContextFileNameSupTab.K")
end
return mp.CLEAN
