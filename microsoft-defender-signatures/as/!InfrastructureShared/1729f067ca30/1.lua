-- Threat: !InfrastructureShared
-- Name: 1729f067ca30
-- Type: 21

local l_0_0 = tostring(headerpage)
if l_0_0:find("Equation.3") == nil and l_0_0:find("%z%z[Ee][Qq][Uu][Aa][Tt][Ii][Oo][Nn].3%z%z") ~= nil then
  mp.set_mpattribute("Lua:OLE.Equation3.NotSentenceCase")
  return mp.INFECTED
end
return mp.INFECTED
