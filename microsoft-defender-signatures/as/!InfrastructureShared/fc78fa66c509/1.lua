-- Threat: !InfrastructureShared
-- Name: fc78fa66c509
-- Type: 21

local l_0_0 = {
  "AGGR:ContextFileInclusion.A",
  "Lua:Win32/ExeFileWithExport.A",
  "SIGATTR:MatchRegOpenKey",
  "SIGATTR:TrojanDropper:Win32/Agent.CG",
  "CMN:HSTR:InstallerFile",
  "Lua:Win32/FileExports.A!__dbk_fcall_wrapper"
}
local l_0_1 = 0
for l_0_2, l_0_3 in pairs(l_0_0) do
  local l_0_4 = mp.get_mpattributevalue(l_0_3)
  if l_0_4 ~= nil then
    l_0_1 = l_0_1 + 1
    if 6 <= l_0_1 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
