-- Threat: !InfrastructureShared
-- Name: 5d78de06b031
-- Type: 21

local l_0_0 = "Lua:Win32/FileExports.A!createpluginobj"
local l_0_1 = "Lua:Win32/FileExports.A!getplugininfo"
if peattributes.isdll and peattributes.hasexports then
  local l_0_2 = pe.get_exports_count()
  if l_0_2 == 2 and mp.get_mpattributevalue(l_0_0) ~= nil and mp.get_mpattributevalue(l_0_1) ~= nil then
    return mp.INFECTED
  end
end
return mp.CLEAN
