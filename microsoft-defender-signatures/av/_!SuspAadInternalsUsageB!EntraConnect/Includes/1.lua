-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!SuspAadInternalsUsageB!EntraConnect\Includes\1.luac 

-- params : ...
-- function num : 0
do
  if IsADConnectRole() then
    local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
    if l_0_0 and l_0_1 ~= nil then
      l_0_1 = (string.lower)(l_0_1)
      if (string.find)(l_0_1, "\\aadsyncsettings_job.ps1", 1, true) then
        return mp.INFECTED
      end
    end
  end
  return mp.CLEAN
end

