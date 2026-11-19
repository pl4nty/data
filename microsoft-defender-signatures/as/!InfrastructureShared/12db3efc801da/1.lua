-- Threat: !InfrastructureShared
-- Name: 12db3efc801da
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = {
  "NtQueryInformationProcess",
  "NtQuerySystemInformation"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if isnull(bm.GetProcAddress(l_0_0.ppid, "ntdll.dll", l_0_3)) then
    return mp.CLEAN
  end
end
return mp.INFECTED
