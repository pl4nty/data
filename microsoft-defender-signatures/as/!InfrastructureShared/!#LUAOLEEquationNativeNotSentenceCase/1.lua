-- Threat: !InfrastructureShared
-- Name: !#LUA:OLE.EquationNative.NotSentenceCase
-- Type: 13
-- MpAttributes: SCRIPT:OLE.EquationCLSID & SCPT:OLE.Equation3.A

local l_0_0 = tostring(headerpage)
if l_0_0:find("E%zq%zu%za%zt%zi%zo%zn%z %zN%za%zt%zi%zv%ze") == nil and l_0_0:find("[Ee]%z[Qq]%z[Uu]%z[Aa]%z[Tt]%z[Ii]%z[Oo]%z[Nn]%z %z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]") ~= nil then
  return mp.INFECTED
end
if l_0_0:find("\001%zO%zl%ze%z1%z0%zN%za%zt%zi%zv%ze") == nil and l_0_0:find("\001%z[Oo]%z[Ll]%z[Ee]%z1%z0%z[Nn]%z[Aa]%z[Tt]%z[Ii]%z[Vv]%z[Ee]") ~= nil then
  mp.set_mpattribute("Lua:OLE.Ole10Native.NotSentenceCase")
end
return mp.CLEAN
