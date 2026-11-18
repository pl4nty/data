-- Threat: !InfrastructureShared
-- Name: !#LinuxEditSystemLibPreload
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: BM_TEXT_FILE & (LUA:FileSizeLE100.A | LUA:FileSizeLE200.A)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_1 ~= "/etc/ld.so.preload" then
  return mp.CLEAN
end
local l_0_2 = tostring(headerpage)
if l_0_2 == nil then
  return mp.CLEAN
end
for l_0_3, l_0_4 in ipairs(split(l_0_2, "\n")) do
  if l_0_4 ~= nil and l_0_4 ~= "" and sysio.IsFileExists(l_0_4) then
    mp.ReportLowfi(l_0_4, 4017216192)
  end
end
return mp.INFECTED
