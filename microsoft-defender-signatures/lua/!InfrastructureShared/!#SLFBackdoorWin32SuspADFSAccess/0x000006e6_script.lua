-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFBackdoorWin32SuspADFSAccess\0x000006e6_luac 

-- params : ...
-- function num : 0
do
  if IsADFSRole() then
    local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
    if l_0_0 and l_0_1 ~= nil then
      l_0_1 = (string.lower)(l_0_1)
      if (string.find)(l_0_1, "adfstoolbox", 1, true) or (string.find)(l_0_1, "test.serviceaccount.ps1", 1, true) or (string.find)(l_0_1, "adfsserviceaccountmodule.psm1", 1, true) then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

