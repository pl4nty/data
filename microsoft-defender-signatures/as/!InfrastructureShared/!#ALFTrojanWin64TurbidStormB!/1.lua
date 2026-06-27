-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanWin64TurbidStormB!\1.luac 

-- params : ...
-- function num : 0
do
  if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and (mp.get_contextdata)(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
    local l_0_0 = (mp.GetMOTWHostUrl)()
    if l_0_0 ~= nil and (string.len)(l_0_0) > 50 and (l_0_0:find("T094F59BD8Q", 1, true) or l_0_0:find("T08KA0Z88G3", 1, true) or l_0_0:find("T0A35DUB73R", 1, true) or l_0_0:find("T09SL360MU2", 1, true) or l_0_0:find("T07PL5691KR", 1, true) or l_0_0:find("T09G538NG4V", 1, true) or l_0_0:find("T098BKWF222", 1, true) or l_0_0:find("T096G5KPZ7B", 1, true) or l_0_0:find("T0AQ9HX9L13", 1, true) or l_0_0:find("T088L818WN6", 1, true)) then
      (mp.set_mpattribute)("//Lua:TurbidStormDownload")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

