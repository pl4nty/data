-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\329b336064b09\1_luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[1]).matched then
  local l_0_0 = (string.match)((string.lower)((this_sigattrlog[1]).utf8p1), "microsoft.6365217ce6eb4_")
  AppendToRollingQueue("DefenderForIdentity", "Version", l_0_0, 31104000, 5)
else
  do
    if (this_sigattrlog[2]).matched then
      AppendToRollingQueue("DefenderForIdentity", "SupportedUsers", (this_sigattrlog[2]).np2, 31104000, 5)
    else
      if (this_sigattrlog[3]).matched then
        pcall(MpCommon.RollingQueueErase, "DefenderForIdentity")
      end
    end
    return mp.CLEAN
  end
end

