-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a2cf_485.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = (mp.GetParentProcInfo)(l_0_0.ppid)
if l_0_1 ~= nil and (MpCommon.GetPersistContextCountNoPath)("UACBypassRegSet.A") > 0 then
  local l_0_2 = (MpCommon.GetPersistContextNoPath)("UACBypassRegSet.A")
  if l_0_2 then
    for l_0_6,l_0_7 in ipairs(l_0_2) do
      if (string.lower)(l_0_7) == (string.lower)(l_0_1.ppid) then
        return mp.INFECTED
      end
    end
  end
end
do
  l_0_2 = mp
  l_0_2 = l_0_2.CLEAN
  return l_0_2
end

