-- Threat: !InfrastructureShared
-- Name: c141703e9379
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = string.lower(nri.GetURI())
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {
  ".jpeg",
  ".bin",
  ".jpg",
  ".mkv",
  ".exe",
  ".dll",
  ".bat",
  ".xlsm",
  ".bmp"
}
for l_0_2, l_0_3 in pairs(l_0_1) do
  if StringEndsWith(l_0_0, l_0_3) then
    reportHeaders({"Host", "User-Agent"})
    return mp.INFECTED
  end
end
return mp.CLEAN
