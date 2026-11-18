-- Threat: !InfrastructureShared
-- Name: !#LUA:OLE.EquationNative.NotSentenceCase
-- Type: 13
-- MpAttributes: BM_OLE_FILE & !(SCRIPT:OLE.EquationCLSID | SCPT:OLE.Equation3.A | MHSTR:MacroInside)

local l_0_0 = mp.getfilesize()
if l_0_0 < 200000 or 1000000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
if l_0_1:find("E%zq%zu%za%zt%zi%zo%zn%z %zN%za%zt%zi%zv%ze") == nil and l_0_1:find("[Ee]%z[Qq]%z[Uu]%z[Aa]%z[Tt]%z[Ii]%z[Oo]%z[Nn]%z %z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]") ~= nil then
  return mp.INFECTED
end
if l_0_1:find("\001%zO%zl%ze%z1%z0%zN%za%zt%zi%zv%ze") == nil and l_0_1:find("\001%z[Oo]%z[Ll]%z[Ee]%z1%z0%z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]") ~= nil then
  mp.set_mpattribute("Lua:OLE.Ole10Native.NotSentenceCase")
end
if l_0_0 < 500000 or 1000000 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
l_0_1 = tostring(mp.readfile(l_0_0 - 8192, 4096))
if l_0_1:find("E%zq%zu%za%zt%zi%zo%zn%z %zN%za%zt%zi%zv%ze") == nil and l_0_1:find("[Ee]%z[Qq]%z[Uu]%z[Aa]%z[Tt]%z[Ii]%z[Oo]%z[Nn]%z %z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]") ~= nil then
  return mp.INFECTED
end
if l_0_1:find("\001%zO%zl%ze%z1%z0%zN%za%zt%zi%zv%ze") == nil and l_0_1:find("\001%z[Oo]%z[Ll]%z[Ee]%z1%z0%z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]") ~= nil then
  mp.set_mpattribute("Lua:OLE.Ole10Native.NotSentenceCase")
end
return mp.CLEAN
