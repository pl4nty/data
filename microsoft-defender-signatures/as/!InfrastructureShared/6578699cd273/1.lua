-- Threat: !InfrastructureShared
-- Name: 6578699cd273
-- Type: 21
-- Includes: LuaFuncHelper

if peattributes.isexe == false then
  return mp.CLEAN
end
local l_0_0 = mp.GetCertificateInfo()
for l_0_1, l_0_2 in pairs(l_0_0) do
  if l_0_2.Signers ~= nil then
    return mp.CLEAN
  end
end
local l_0_3 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_4 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_3 and l_0_4 then
  AppendToRollingQueue("Trojan:Win32/EnumDesktopsA.AM", l_0_4, l_0_3)
end
return mp.INFECTED
