-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanPowerShellClickFixPsObfusA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)(l_0_0)
if l_0_1 ~= nil then
  local l_0_2 = (string.lower)(l_0_1.image_path)
  if l_0_2 and (string.find)(l_0_2, "powershell.exe", 1, true) then
    local l_0_3 = (mp.GetParentProcInfo)(l_0_1.ppid)
    if l_0_3 then
      local l_0_4 = (string.lower)(l_0_3.image_path)
      if l_0_4 and (string.find)(l_0_4, "mshta.exe", 1, true) then
        return mp.INFECTED
      end
    end
  end
end
do
  return mp.CLEAN
end

