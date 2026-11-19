-- Threat: !InfrastructureShared
-- Name: !#ALF:kerasSuspiciousMLModel.SA
-- Type: 12
-- Includes: BMLuaLib
-- MpAttributes: RPF:TopLevelFile & Lua:kerasExt

local l_0_0 = tostring(headerpage) .. tostring(footerpage)
if l_0_0 == nil then
  return mp.CLEAN
end
if contains(l_0_0, {
  "readfile",
  "writefile",
  "lambda"
}) then
  return mp.INFECTED
end
return mp.CLEAN
