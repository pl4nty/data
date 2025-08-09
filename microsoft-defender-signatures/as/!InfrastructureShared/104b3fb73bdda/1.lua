-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\104b3fb73bdda\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC19: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC20: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC21: Overwrote pending register: R3 in 'AssignReg'

for l_0_5,l_0_6 in ("NtQueryInformationProcess")("NtQuerySystemInformation") do
  if isnull((bm.GetProcAddress)(l_0_0.ppid, "ntdll.dll", l_0_6)) then
    return mp.CLEAN
  end
end
return mp.INFECTED

