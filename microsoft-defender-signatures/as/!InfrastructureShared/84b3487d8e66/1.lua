-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\84b3487d8e66\1.luac 

-- params : ...
-- function num : 0
if not IsActiveDirectoryRole() then
  return mp.CLEAN
end
local l_0_0 = (sysio.RegOpenKey)("HKLM\\SYSTEM\\CurrentControlSet\\Services\\NTDS\\Parameters")
do
  if l_0_0 ~= nil then
    local l_0_1 = (sysio.GetRegValueAsString)(l_0_0, "DSA Database File")
    if l_0_1 ~= nil and (sysio.GetFileSize)(l_0_1) > 51200000 then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

